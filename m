Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C4C303B20
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74842.134574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MCo-0001DJ-9e; Tue, 26 Jan 2021 11:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74842.134574; Tue, 26 Jan 2021 11:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MCo-0001Ch-5i; Tue, 26 Jan 2021 11:08:18 +0000
Received: by outflank-mailman (input) for mailman id 74842;
 Tue, 26 Jan 2021 11:08:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4MCm-00016Q-Ar
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:08:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d6ef972-d78c-45e5-aa18-7f0d3e3da4a2;
 Tue, 26 Jan 2021 11:08:12 +0000 (UTC)
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
X-Inumbo-ID: 8d6ef972-d78c-45e5-aa18-7f0d3e3da4a2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611659292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=NFFOG4gSGPKaBD5plci1+We3i0aKp6X529Jz1vT/8E4=;
  b=dHkFwsb0bPKj0JmNmBaf9zWnolsfaq8cUCf5tot5BGPJNpMrvU1pvWt2
   L0nmDq/vDNy8ll6fi/tR2itoR8zd4hcoVoIlNULC9WSdp/POt1JoFONHK
   HDVN96znaPN/rCib+BJb3lJI6hoyM8gSOxhOEmFL0rL9VL2FP3VXLOZv9
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /tecgAs6H4UDCV+/njuDxMCH/oRRHd0toI6QxyLZjQUrEHuHJ+A94xapCMbDBK3ThuzctWmebb
 6mOzpMG81kkJkuG32bMsgjg0sEFYWbzrK5LIbQPqASsRKafIoY7xIZ/ewcBd3XM/47+KqYYqn4
 shC5Nron5349WwpEG6HEGpQojqwHW2GNW/oI4X2dhPJu4YNi6RQcVaFtfwFQnhLS8Ulv48WPB+
 t9AZ1qF9fEpM839STriChK0/8uoR8RYfBCBQ94NyUqaJsKodrmQh5WpSAFWyYU1Or4p7dWzBX4
 n9Y=
X-SBRS: 5.2
X-MesageID: 36062434
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="36062434"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHlkzs4Ym26muNJH4UZfn0PbasHQDNjKjfnRqx9DwP9hphjUIsSVH6sV1Xc6OsgtsX8zsRIZ3A2P5SifHk2SiIMRqGAATj70TBR4TBzfzbz2E/9zvcbHr+G/psN+SCBRWdTDG5wasxqHkVnN/7PBs55A2OKoC2QS3zpunW2ouao5c17foO0xd76YKI+ZEdbvdmKzeVWClcQJLgqJsvdRNSeRPxt521kEuEY1y/Ylic6BlhHNAZ7l018Ju0uzr2vTMgtRZt5VQb1WTH7XS33vTRwV5A6RleUk48S4bMQcvB2Ya//L9C7VVF5K3qCMluan3R1yuu4r9YU30Jbzi10MYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35r293zGi7bEtyf6UwXJ4l7Clf7lDN7gCH2LmyYvRfE=;
 b=VxvJHthnt0grba5LtwZhHttBu79zOyrlU7rfclDQNFD76YUxEn1BtgWHW3i/F5ny8KlIUNCLqZmxUE+JsZUMcYUe0DDDd08UP/gDTHxy8Q/esdBkvh7ax2JgFiHfYcrOv1/RzSWjgNaurw51ui6j4Z+8L+oiukweK6tEF3YrJOXz8s7Ri2iBx+XsViCjTyt7x+EZa/BR+d/I3+Vcgxcp2CxgQiJwcdRp6hA+HQCliZh7dHtmtdK8tGZ1YJz9jSTlVPYEKiaNthhq+I2YXB+Rnw8oqA2mUyMjPcHIQ6SK8sQ7RKgFsEb0+O6Gd0LW411dWxEP27z4CGme7+rgaGjgKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35r293zGi7bEtyf6UwXJ4l7Clf7lDN7gCH2LmyYvRfE=;
 b=BambPaF4Q44P8ByC916lNXpXYw9ROYE8LFHzfVFDd4KEeML6MDQZLsnPM33AMTqd8gjSH2RukBgP8fGZpWXRlenl8mENeOvm7RDgg2O5wr0aDhyu/Gn80pLcnc2NDcaR35JwzV0HkVSd6EmLLvm3cr54c8x9a4Pfa6LY5tLuB1g=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/irq: don't disable domain MSI IRQ on force unbind
Date: Tue, 26 Jan 2021 12:06:05 +0100
Message-ID: <20210126110606.21741-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126110606.21741-1-roger.pau@citrix.com>
References: <20210126110606.21741-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0051.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d83302d2-fe84-4d3e-5f06-08d8c1eaaa67
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB40593742216507CD960F1D318FBC9@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cWrFS7Hbnf2Iwi12tyWAm778CYtuXDP1+G9ace7TR0AnfDIUKP+r/DIgm9UbCLd8YoYH1DRgyx9v3DjFies/iNVFcdq8hkYPya+mcZ/Rba0U4GLGa+eefjvGDTsP1KZVbK9sH3yfrqykYPM4MLy2SHDlIcuwebfKEvbmQHll11IRcYL9yM/wLzA6mU6L4zbbPKtiSTraKdrrTv4MpR5SS9hy1tkzDSujpVj+YBkYzqbjG8jIV8BiVhrgjg890AvMlue53iv6xWFfAlWl4c9QR+j+jiwiz4ZcV4VZgtEvbjp+Gxhd/l18Tt2RiC+PTsK7atDSivjRVYvBFeMhqPmfHWlOOf0jeEJTRqV/eQo8hQEIbvAvmrEph0gpMI1KVhAdnwhba7bPVPccXXR+o79tmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(4326008)(186003)(83380400001)(478600001)(26005)(5660300002)(2906002)(66476007)(54906003)(16526019)(6496006)(6486002)(6666004)(956004)(8676002)(2616005)(86362001)(8936002)(36756003)(66946007)(6916009)(66556008)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NmRVdUh0eGtZWnMvV2YyRlMrNVJwUTd5OE5UY0RjeUIzZmZYSnQ3eU80TVJS?=
 =?utf-8?B?TUtxM0xZWHNKZE1LUnhGTkhlUVJxaHd6REwvTVRQNGRxZGhOeldDbFVhTUpn?=
 =?utf-8?B?d1plVHgvSnVRWjhYalhpakkyeHF0a2l2Wm96d2VlUm5Qb0N6dm92YVZQNFV1?=
 =?utf-8?B?S3BVZVJDbGhyNzlDZWUzazA5NVhxVGFDYVVoNWJHd2o2QWRuR3VxemRodnBG?=
 =?utf-8?B?cTJQK3dicHBlaFRUVjhUeHY1elZ1MGpmcWErbkUvRlJ5MXNIUUJVeW5qRnRt?=
 =?utf-8?B?ZmRjK2NRSFV4Wk9MRHpJcmJtYzY1TTc2bDRmY1V4TVJJcHB4TitidHpnZHpT?=
 =?utf-8?B?NXVVWEpHd01tdTBCT08xaVI2TlpnaWZuZWEwUXF3RTM3R0MyMWJhQnRUb2l4?=
 =?utf-8?B?TzJTTkhQdm9qQTRWeVlmNUk2eHFwM2xGREM1M0Q0TWxIcUxaZW80OUFybm1r?=
 =?utf-8?B?VVRySTdIUTB5T3c2TUVPZWpJL2ZOK21ESkplaXduNTIyMG02R2o5QkhDSWNw?=
 =?utf-8?B?bUlNb2dqQ0RwcW1oaGlrMmtRVGJ4bXFNaDBDemZ3RjdnZW9QMngxMGpvYUFm?=
 =?utf-8?B?NVBqQWpMa2cyZ2xNSlVxdUY1RVNLeWdFN1NJN3ZDelJ5Wlg0VDZENlBMTTQr?=
 =?utf-8?B?VGplRm9GZ0w3a1IyeEd5YWVHTHlHVzlGeHZpQ3BkOThuVC9NTzEyM0ZhMVhP?=
 =?utf-8?B?anhhVG51dVdPS0M2U2tEU0JUTmhWcVVMMnlpeDZ2eitKN3p1TWlzbktrdW8z?=
 =?utf-8?B?SUVNZkV5eGtLSUluaHo1KzUrQ2dIQk10cWEyZGx1QytyQmIvY0NrRE02bG1O?=
 =?utf-8?B?Mm5yRm9SRGViSThQbnI4emhSRW5ESHpXZjR5NzUyMmZrdEpWTEFnejRaNFV5?=
 =?utf-8?B?cFFhcENpTmI1NXRxNXBvNkNzRmYxc1EzZjJmYU4weWNsMHJ5bDJvSzFLQS9G?=
 =?utf-8?B?SFVBMTgwbkx5aFIvRU1nT3YwRnhtbVVTK2k1b2UvR0FYb2d6VFp0SEZlWHNx?=
 =?utf-8?B?dER6LzFRWXp2eEVmVjNvYUxkS0hvSXZubEZ6ZENCVVNSMXIvWFFVT3VWUE5a?=
 =?utf-8?B?RlZISjB5TVAxWkNmRkhwemlVV1hlNEFON2d5MjdQRW9ncmdHMDdkQlNLaVhL?=
 =?utf-8?B?cWlvNnZUazVucjQvOUtiLzUwbnVDZzdYUExIcjVmNzZwcERncWwvNmtmK2xU?=
 =?utf-8?B?ckkyc01kdjZ3elhjODNLR0czVW9pUisreC8wZzc2aTFQblhwK3oveHVlY29Q?=
 =?utf-8?B?bnZybkNwMXpKZUozZDBvanJGb2UxME43OTlxYVJpNlBBVEJpQVoxeFV5TnZU?=
 =?utf-8?B?Mm14Z1V1dC9iMHREcVFvOUxKaENsNmp0Smk1ZkxKZndBeFRSUDhjUWc4R3dn?=
 =?utf-8?B?RS8rTTJ3dkJwTUZiQUxrWGVhOVozTjJqSElqYW1lUnBMSU94VUxiNkdKUWVi?=
 =?utf-8?B?QWNkTldxYzlxSzRYd01yZDFHMXZlMmZKeEJ1K2JnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d83302d2-fe84-4d3e-5f06-08d8c1eaaa67
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:08:10.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aauG811DK1k61O+3oVDMpfWUXgmNDBWM2qwhRlIp+WTiZOTQyPOCLHN+xppoQZAY84/pxxAN0HbPtJKSRgAHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

When force unbinding a MSI the used IRQ would get added to the domain
irq-pirq tree as -irq -pirq, thus preventing the same IRQ to be used
by the domain. Doing so for MSI allocated IRQs prevents the same IRQ
to be used for any other device, since MSI IRQs are allocated and
deallocated on demand unlike legacy PCI IRQs.

Ignore forced unbinds for MSI IRQs and just cleanup the irq-pirq
information as normal.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
It's not clear to me why we add the irq as -irq -pirq to the irq-pirq
domain tree on forced unbind, as allowing to bind the irq again should
just work regardless of whether it has been previously forcefully
unbound?
---
 xen/arch/x86/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 49849bd7d3..c8e5277eb1 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2362,7 +2362,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
     {
         BUG_ON(irq != domain_pirq_to_irq(d, pirq + i));
 
-        if ( !forced_unbind )
+        if ( !forced_unbind || msi_desc )
             clear_domain_irq_pirq(d, irq, info);
         else
         {
-- 
2.29.2


