Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A5B2CA9E9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 18:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42238.75945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk9eT-0006Ye-F3; Tue, 01 Dec 2020 17:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42238.75945; Tue, 01 Dec 2020 17:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk9eT-0006YF-Bf; Tue, 01 Dec 2020 17:41:21 +0000
Received: by outflank-mailman (input) for mailman id 42238;
 Tue, 01 Dec 2020 17:41:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SK29=FF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kk9eR-0006YA-2L
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 17:41:19 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00dab951-975e-4f50-bae8-55646c65eb20;
 Tue, 01 Dec 2020 17:41:17 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 00dab951-975e-4f50-bae8-55646c65eb20
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606844477;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=iVIc1mh7sDE1Fnb0UisdiqFgekYPnrQJrEvAysjGp0Y=;
  b=Y4vkIYR8l4xtnczW3G2hiOg+qlbCtud/qICSvkB3p4X/dpKOjih1h4Bf
   uPZCydNoyp1paPg7D560AHLp8eNys52TVtLLzkohCORlpy83va2JGaQA7
   iDSVjW5WqC0OPoJPAqOblpOr3UAWT4aoeZFt4Gbpn05JCb6bR8IPadhw2
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SNTO5zvFG3vmfPRGVZxraIs5vumKDfiQncyQajZBiuCY+9XbUTxDf6uCZAfbndae1BpsEfoUP4
 LaAbZMY1ytuZTlmvYIPpaejRyUkpqUOL2MzLNxil4pSSjigdu2kR2/mUEBNg2trWrX1lDt7IaN
 SDw7YDVNiCvIGtiAnefMxYXNTsw+QiXR6KPvMOvSXYDlR3IAOkXKiGiS/Hr9ZKiBqvYYiX/AbK
 54qFJMmc+Azd9pSVNMdY7GG+yTA8KvuW8i+AplLGh9Myenu3h0jX/+Zjj3SRRTi5TYRMboK1hz
 QPo=
X-SBRS: None
X-MesageID: 32512932
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,384,1599537600"; 
   d="scan'208";a="32512932"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqo/vHwpk/3MClzVP8XD1oAHeNbS2LDTcwOhbLB3b4cC3qF8jpFXxm/3VdSKBYyo3HFsBjoy5deYbwGAPHIXkZe3CmgfTEBS0pjjQCTtylOpCEzhG0JdMVvyrHKQVCeTulrXldiZ/ANtopTwJC7fyR5vJZHDuIa0MeLNKg6TdR3wg7mIDKF69rkcM+fXPl3lWGteAYMUnWKcDVhSjznBLR1WZTtPbp6V/VDt4TKyiCAUjqb/LXWIfnHVTgmUOBZXNbTdoZeqBn/nwmywoAvbAmkvf9JzNAaKENWIPcyG7f0ttOQ51wfsGGYKVGyX4cKwIR2u6Zp6BBTHXmtGgDftow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUilLypEJA41k654QAtYtSzKwPvDXaDonCVZeP+ybGU=;
 b=VBzgTq7SWTa9gheBt5P4oG7iitpxus0MpWETGiLDI1y3F/6UNZch4sGfPBWHJL+7YgH47TSKjsZ47LRwS0vtbFn2JmZSmX99Fxxy8CYD87pmdhnI/Vijz6pduYdg9BZmuzb9PJcSS73QiA8VIpPibc42KLsktF+yXMG021E3npE3skCF5gy/Gnq85Wj8Bqaqki7fBlaClo0Pj170QeI4zFPqoq6wxJKkqwK+4etFjcbj21hgCznV3E4r5dW9Z4iF5jRYEMCt8PBjEpg2sF2oWb/eF/IAkZ5pUPfEnrP5QiOvIhU338fMc/r02gAy26QnPV0H8bKiOa6dAxlv57Utug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUilLypEJA41k654QAtYtSzKwPvDXaDonCVZeP+ybGU=;
 b=az47rUEnquYsfKy4Kb7oDa+pXhKWvz1DI6NUhncUqrgcD5V6BIqoNZrVEkkTbrkLYZPGAf6GVgtZDJ3rgMNRoR6XAZwBCNVR1KJF+NFsrK4S1mDlyc3EJhlc8MrbdynKVCOL2jZhn9ndZORCn/5rUnIQMDTe6wPxhFhPs11TXU4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@antioche.eu.org>
Subject: [PATCH] vpci/msix: exit early if MSI-X is disabled
Date: Tue,  1 Dec 2020 18:40:14 +0100
Message-ID: <20201201174014.27878-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab532a1a-80c4-4027-997f-08d896204309
X-MS-TrafficTypeDiagnostic: DM6PR03MB4604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4604A840C0710899432703488FF40@DM6PR03MB4604.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TZhSu8HUz2Nep/mHiP0wOjPb94JY48CffdPCEYcm00tG/msVK+C2mdxVELGegnrZWXuqk5vpqrKniE1b1JfCGH/dsWWM8sOcGjCceNp0wgbCmGRVOHaUmEBg7Z5bn9QEzXxbhJ0Cm6Uy/CnIrTrt3Qpw0zQLEs6exh3GfZfrpB6yYnadwDrqYv/OIU3e9BMy1576cnhjLRC4LkcggswqMd5Rz2NuRL32mkHOM3k7xAc8+8wFd1Azhby5lbDEphYxcsjod1NthITJyGPwIKhzbYj0BuW8aRk2u5DrUFqKw4o5gZaBxGg8RrptV0U4TeHX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(66946007)(5660300002)(956004)(1076003)(6486002)(2906002)(66476007)(4326008)(2616005)(6916009)(6666004)(66556008)(8936002)(36756003)(83380400001)(16526019)(186003)(26005)(8676002)(86362001)(54906003)(478600001)(6496006)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?azFnY3J3UGtCVk9HQStKMlVISkR5VDI1MG9vQlNWZjNkY1ZlUnZseVZSTkcr?=
 =?utf-8?B?eHBRNXh4ZnVCdm12ZlBxMmFyTXMzU2tUSDlmUFljQkRrRk54UlRVUk1wQWdv?=
 =?utf-8?B?cXcxYk02Q2MxcU9DUlpVYlZDd2kxN3luNmRCUlRNVHpCYXJBQVlWS0JTSVpL?=
 =?utf-8?B?cVVwT0RsTEJWc2Iya3Z2YytiN2hieVlIWWxhRDBVY3lsZ3R1OTJPYStISHky?=
 =?utf-8?B?TEIzTkE1RmUyb1UrZytjRXBUUzJncVh4MURFSnNneEVSUHhkblp4OGlpOWgv?=
 =?utf-8?B?UDJEaWJhYTUvVHA0TDVrL3BpS3VCMFNJQTh2NjRZeXRzNkdhbUFvc3RranVF?=
 =?utf-8?B?OTFKRmRrTFAxNEVIbzhoN2JnaEg1dTlza1BZeUIzNmNhUlNEcTNGYTViclBY?=
 =?utf-8?B?ZlJLWmdtaGFvbE9MZXB4eGxOQzhST1FTWE9zVFJ1Y2xkYWxqVUMrYlhpd2x6?=
 =?utf-8?B?aU1oVzluQ0lUMHlnUVZsY3JXNldrVVRobkQ2MGlUV0MxRXprVnNjdkw3eUNN?=
 =?utf-8?B?SjFLdHJ6NGQ0YUtKc2ZYYzhvUmEzd0tJdFFRdDdvL3Nxd3BuS0N5Sk5kTlFC?=
 =?utf-8?B?bWRjMnBLdWF2Wld1SlhOQ0c1OWxpUXhQcmZoaFp1eXVlVUF2RmpVQzloa0ZB?=
 =?utf-8?B?K3RLcGVwNXZkUzlqLys1RXgzdDYvRE9vYVNuMGRkYVkrelYwNDBXckdIbTMx?=
 =?utf-8?B?bCs2dDlSWHdPcDFobW9HUkpRNGw2Tk9VVnUvRHBQbDlJNFV4eml5YWFJaXV4?=
 =?utf-8?B?Vjh4d2xpendhZEZlTFlUa2JrTjBsZC9MYUc1VXlOY2RjM0VwQkRtQnZtemdw?=
 =?utf-8?B?dndSNjk3Q01tZnEyU1BTVjhzNStiN1hYZzMwak9RNTBvVkkzRUNBakppOGJo?=
 =?utf-8?B?dGZmbGU1RzljcDN6bnZBUm16aWc3OFc2KzFWMlF3TFZ1N2tPbzhpNGpMdnUx?=
 =?utf-8?B?VmtkUGJJUG93cXdUTENVUzVwbmZCbGlRclRVcHRITU9xQlJzMlQxZUUvUnFG?=
 =?utf-8?B?TE0reldZRFFCQnJQSXB4MUtTSXVKWWJGbnhCOGxkdEEzd0VrcFlrL0pNM0l5?=
 =?utf-8?B?bmlYajF4d2orajZ4bDRJWU54aUZtTUZ3UVVGcUIrY3F1ekVrZ2t5eS9aOWFK?=
 =?utf-8?B?VEJHeUliZXZFamtodnEwZXJFNkpwMG1DQmhoZ3BNR0l0Nm9RT1dvbHovRVZR?=
 =?utf-8?B?OGRGbTFFbnI2Tk50TVR0SmlWVXVRVk5BMVlJZGZNdEJsY29qRVlnSjFxaEcr?=
 =?utf-8?B?TkQzVVhpcVo5b01JTlh3TW9EY01JMWxabnlFYkxXWHJNbE0xRERuOFJod1ND?=
 =?utf-8?Q?n6Ow8iKRO7WQbbNRwjniLafNsIE56Kxs+X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab532a1a-80c4-4027-997f-08d896204309
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 17:40:58.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqr+/tm6zj24vmTeL0dyhAUrswEgFvXGLkOc+MUKPxCiTblOYbl+eVJN6neHzgpgIdJlGhzbuCfeLiBkGHh5Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4604
X-OriginatorOrg: citrix.com

Do not attempt to mask an MSI-X entry if MSI-X is not enabled. Else it
will lead to hitting the following assert on debug builds:

(XEN) Panic on CPU 13:
(XEN) Assertion 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843

In order to fix it exit early from the switch in msix_write if MSI-X
is not enabled.

Fixes: d6281be9d0145 ('vpci/msix: add MSI-X handlers')
Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/msix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 64dd0a929c..93902ba7db 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -357,7 +357,11 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
          * so that it picks the new state.
          */
         entry->masked = new_masked;
-        if ( !new_masked && msix->enabled && !msix->masked && entry->updated )
+
+        if ( !msix->enabled )
+            break;
+
+        if ( !new_masked && !msix->masked && entry->updated )
         {
             /*
              * If MSI-X is enabled, the function mask is not active, the entry
-- 
2.29.2


