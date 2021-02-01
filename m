Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D7E30AC0E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79999.146062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bW8-0002Wq-IW; Mon, 01 Feb 2021 15:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79999.146062; Mon, 01 Feb 2021 15:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bW8-0002WR-FP; Mon, 01 Feb 2021 15:53:32 +0000
Received: by outflank-mailman (input) for mailman id 79999;
 Mon, 01 Feb 2021 15:53:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6bW6-0002WM-JT
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:53:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5f9866f-56a6-418b-94ce-f214d1f72f71;
 Mon, 01 Feb 2021 15:53:29 +0000 (UTC)
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
X-Inumbo-ID: c5f9866f-56a6-418b-94ce-f214d1f72f71
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612194809;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=37NP3hA19mATChF6+CPr6RY9nxCTxiiI2Dv5z+vtpbE=;
  b=eUT0oZjFI1uJy+C4Q7l2/ElRnZXXNH1TYZTsFB4foIhNTMySAx2/alqT
   fjMzqqnhj/4iITcJGECM2RfdErss5gYIlrna5GjyTV96D8+OD+wfwUfqP
   hP516AogKGRbq5AZnEcPxGWfJlLdBOzg2iRo1sWm1Y6qJxRX6SUGO13aE
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RPBavhJpHSuOHx0j+Bng8nXyIOYuVzWnqDUqjnRXdXvDVzCZFWpWWVDVplfscdt0eKUBvhshIg
 ZcT8FEunAdUn8i6rYwLhUmHudxw2o/Na1go4Q4Pp4Rh7GNi/y8IpzohkfE25JZdcVjCsjLb71P
 4on6y4uAihir+cx2zczE0LqlvMtP2V8DT9ReE/baEjT2wpavKH1VI2DmTty2rAxbBSP3A9TYBw
 q7u7cOuHxHsMhRbPqQnp23mdkpBjxSH3bf86/W+i9fslJTxmQ5ARitTFTvrHdflbq5w+MBbSGq
 vOM=
X-SBRS: 5.2
X-MesageID: 36245957
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36245957"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsbH68arlPt3ocUXg97ZmN6V7XNDXi0wLyPJAwc0x+INvi5ImnnIy4TQpUvoUvJqF2kcKn9tE3KQOLfHguYZ9tx5Irx+6S9RzqBPkrxbh4Yg6Ezm5BdiqAWKWESH9RKN/xGRIVtZH7QEE1+08a5EIixmePqRy4T+BJ7MnHmJ89JCt1eW94nnbm2K2uPFofU85QO6/r18dMVyz7pNO5El7a/CuS2GgR1xRplDXsge1SXy4SzMOBp8z+TNXmNrAJSOH65MODM8DWMzx+1Ui6ZnvXFwcsPADDRF3kG+MKAhVSjfZQPWGv+SC4fd83NlWV3UIGcIBqGZW8BuuKc9KYGJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DPZlqJy76uCRvHmXUZW2JcqPlPoOx4QIRUbMcfhIqg=;
 b=SyrTSbySOgGqcALJ61oi+W7md9LOKtt1P2YKRAxNM302+3kMO9LYhNSzawcuLsIWKGmtz77Zv6Efuvf9rINkNa41Bwo3+h2bL7LDzYrvYl0WLWCdyHEmYLWofU8aOIHnZEfcapQGAXtt18JGpJlxHvhkhJPyiiFv6hhFW4UWQIY6caeffEPBwMhOl5hFqv+AerIHqlk4C1kNoYJ+8SNYDQUDKnLvBhdP5Iq5TathV2yaydBOgT0WFFaGuLaLtszq2bJSuSozdKGYAdCSCPwdoK3YdToWr59FDEp8YJyuzq8RncgZXEKHn6z7AMkwMhCTsYJYgEOGeD25R6rpOqWJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DPZlqJy76uCRvHmXUZW2JcqPlPoOx4QIRUbMcfhIqg=;
 b=Tr+iiFiGXFACYa2OFlfqaJ3kdZ6aRNdpV6ILHQbXK72Y8P+ZOrqFT8ZZxkpX+xTZ/3+hxUY/m3ZItYEGfTG4K5NasgAAW/qnRb+ibK4Iu65UCjquDOxZrIfq3s6fDCgSD7GbeivCGJ0dHfvQVgeXObU2GJBtQFukcwcI68Fe3cU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15] xenstore: fix build on {Net/Free}BSD
Date: Mon,  1 Feb 2021 16:53:17 +0100
Message-ID: <20210201155317.57748-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::46) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24a9e2d-5eb6-4f08-61f6-08d8c6c98249
X-MS-TrafficTypeDiagnostic: DM6PR03MB4393:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4393394248E3CF0E0707DD198FB69@DM6PR03MB4393.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AcG9YU1hkEolQkSRw3cwrsdAowtCmJIMQxLwH4io7Yi9FhVXSsr/yBVizUy42wsX3kFZDfnCpFjcSuH+XrFXSHhSbMISBohtX1NB6YsizhEkJ8hAzKgxJxwTzNdSfbF1qw10m2n/qRso4ShWsLYSmXDv5B3kFM65Y8GgVdvLNDfcj4ZYjI3wKI2qyuE6kb7ZchkfkBvvckNecQfBDQoiF9+Db7FrosOb64PCrSAEjc+nYFcBukpb8gCWwhx18idHFaiqPiC9at7H0jQ9zjU409kgdBYOJ/mytkqRCryxVB3whG354OYY3cU5kh7iuJP0qD3BCxobtA55rdbcr7kaMDv0fI8+yNt53nHxTh5agf9IJDgb39J3piTrzXdg3wjgEbOMEEaB8YvaUKbAX3Msfflc8aZp/khKb1JNX2ccBvY1SSoANmOc+L93oEgv5hd6d1iIVtATeo+XmcgVcNlnHjCVlh1kHabjO449YbOGqKjbkjjUxpvswgN56WZYcymX1ii3Kx5tamGpRs6YfLjnDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(1076003)(26005)(2616005)(4744005)(66556008)(66476007)(6916009)(66946007)(6666004)(5660300002)(8676002)(8936002)(2906002)(6496006)(478600001)(86362001)(316002)(186003)(6486002)(36756003)(4326008)(16526019)(54906003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UElvS08reEllOS9mQ2Nhby81YURrcmZrSVJDVnB0emxoTEhlenlKcWN5N2ZE?=
 =?utf-8?B?enRXRW5NaVREK3NndlU4eWhzU3FVREtVb2YvSEZKYkZKVFBEMWFYNGpLQmNy?=
 =?utf-8?B?azVLeDR0RHBTSFQwOUhiT0xSK2p4bVBDQUZTMHNkNEw1S01pN2NGR0dBVGhY?=
 =?utf-8?B?UXY2cGdXUGsrdXNDTkZYOFh6Zm11VzhqemxFVHJCY0dFNzE4VS9Zd1RkY1Fm?=
 =?utf-8?B?NXJYUjg1aUZMOWJJajhQVURpQlJ0VGpGWGNST2ZkcVpOOE5FMVg4ZFgzTlJo?=
 =?utf-8?B?aGVQNXBuVVhCdDhSbE1HTjlFblExaWVmSUp0T0tHQVNOd2NCcW5ZcDRpUGk5?=
 =?utf-8?B?clFUTCtQbG5OUVZ4SE5vdzByOWZXbWdUbFhmZSt4RnVuNzhSNFdhWUNYWUg0?=
 =?utf-8?B?Q0xMdXJHRlN4MThmT3lFN0E0Q1hzRXNqSVdxUkJINUtEWFZEUUpxcC93WjJu?=
 =?utf-8?B?bjVRZk1NRi8va1VybjF2elNnbEZNNGV4ZmFEbUNwQnIzbEN5ZEwwakJBazE2?=
 =?utf-8?B?YzVEb21IZVN3VitWUUs4WkdidktGSWtNbElsU3MvVVREdU82em8zRXJXK2da?=
 =?utf-8?B?RGR3ekcyNXBGbzNsMFJBMlU1b1VZc3RxOGM0dkFQWVZWalRqYTBMWnBWNzcw?=
 =?utf-8?B?VE9WSmN0SWxUeEl1OVNWcFV2N005dHI2ZTB5WHQwdEZrTWxWRGw4RkxzbWor?=
 =?utf-8?B?SjBxdEord2g1dENoSnpkelVFaGN4dUp6UVFBcnVDQStqM3Z2cTlTN0RPb0R4?=
 =?utf-8?B?NlZqOFIrU0xCZWsxOW9ZaWlnRnNGNHdsUGhsenFMZDhCQlkvc1BSNmp6WjRi?=
 =?utf-8?B?V2ZaYWtMenpGZzBOWjBIdXdqK3B3TWFnUU9PT29jNHdORlZyamN1TmNZQVNM?=
 =?utf-8?B?WUkxK3d0KzBKdEJ0Rkk5c204Skl6alZ2bzJUVi9zd0hVbFE3YllIYldVLzdY?=
 =?utf-8?B?ZlpyU1poUmVhV3NCRjFaQjBXYm5zaFdPVlQ5VzBLcmdYMm5MUlRtRUcvdjRj?=
 =?utf-8?B?RHVkMW1GczNsakxlWUxYUDVqcCtRbWRkN294cVdjdEQrcUdUU3F3UC9Oc2gw?=
 =?utf-8?B?eEVZMjVWTzZLZGFwaGdSUDJ2ZkV5V25jckRCV3JpM21uaUswem1lQ3hsalVv?=
 =?utf-8?B?NUlSZFlTR2NaSzFydytJSElFSzJ0cjAxWjBMa0lEZTJtcmVlcXMvNE05N2k1?=
 =?utf-8?B?QXd6UitVb2RsQktKZi94dCtpNFRLZ1lFL1orTE1VSHJPVm9OQUpKMTVDbDNh?=
 =?utf-8?B?cVFRZjIyMUNwOGxjb1FETVlESHdQNVdIMEY5VnV1aDQwZENJVmw0T1lGeHU5?=
 =?utf-8?B?ckNoYmN3NkRUNE1FcTZyWUthOGNiRi9yK0RWajhZREYwd3VSNWxjd0k4dDlU?=
 =?utf-8?B?QndhTkJ5Z1Z2Vy9ESWF6Q0h0VnMwOEQ2a1dDeWkxU01DbG1zbUxDMTg5Y0kv?=
 =?utf-8?B?SjV6MTlsTm5iUVBNbE01a2FwNEZXZjExZnlPcHV3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d24a9e2d-5eb6-4f08-61f6-08d8c6c98249
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 15:53:25.0623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tz0J3Qjy0NlkDVPA2FD5Br7jvL+v2QXs3iQfdjkKSTdk829NPxMzPi61NoBI7Q8mLITfchcz/QzAMdpEHdBVuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4393
X-OriginatorOrg: citrix.com

The endian.h header is in sys/ on NetBSD and FreeBSD.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Only tested on FreeBSD, but from my reading the header is at the same
place on NetBSD.
---
 tools/xenstore/include/xenstore_state.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h
index d2a9307400..1bd443f61a 100644
--- a/tools/xenstore/include/xenstore_state.h
+++ b/tools/xenstore/include/xenstore_state.h
@@ -21,7 +21,11 @@
 #ifndef XENSTORE_STATE_H
 #define XENSTORE_STATE_H
 
+#if defined(__FreeBSD__) || defined(__NetBSD__)
+#include <sys/endian.h>
+#else
 #include <endian.h>
+#endif
 #include <sys/types.h>
 
 #ifndef htobe32
-- 
2.29.2


