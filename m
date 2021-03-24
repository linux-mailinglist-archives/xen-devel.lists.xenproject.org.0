Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BA347822
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 13:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100959.192695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2Sc-0005Bm-30; Wed, 24 Mar 2021 12:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100959.192695; Wed, 24 Mar 2021 12:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2Sb-0005BN-Vt; Wed, 24 Mar 2021 12:18:05 +0000
Received: by outflank-mailman (input) for mailman id 100959;
 Wed, 24 Mar 2021 12:18:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5GA=IW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lP2Sa-0005BI-Ig
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 12:18:04 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a91f983e-8419-4691-9723-b41463147c12;
 Wed, 24 Mar 2021 12:18:03 +0000 (UTC)
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
X-Inumbo-ID: a91f983e-8419-4691-9723-b41463147c12
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616588283;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=MA7RNmnKUxFc7ThtAOfwvxK5EVURvJy926VFsubP/gM=;
  b=WXDeTVWw6eFW3nZWPQWu9bXvSFY5BdcbewSV1jJvHQY/02IW3vlhCNSL
   PptEWqWEapEqrh70uTDHrNw8yTO+IADf04JxF0x3f7woYs+59D3wFxQQv
   OC85bPWua1PowKDKn1vB66jliVAoWbcGW5eR5MfrgW+q6r5RXDOC2pTUF
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ufolKvIAkNeHf3TxRyosTpXzSPo4bFhEM8sTJ9y//1ZaVABUOc3DioOwYPthh0CHVX3MnUWsGi
 EFPw1zTdGiffij860eGuQwfbr3+Hm/wse+qa4mZjMnE0hnzisrYAvn9fSm8lKW+l0lbCLiEUN3
 rw72APvFqxRt47KFIoTnNJy9R6Sv/DYWKXligFMls0fTWL7mS05nlOPgXL5RJc1be5JTaugLxr
 cFON36qovmplZvrscFakmvxSonx9lNQL77hP68JOVR+rukIVF+HU7Vt3utJ1PCsYA4dsOM+x1G
 cYM=
X-SBRS: 5.2
X-MesageID: 40163521
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gaYUYqwtQO9N8akB6MPZKrPx/uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr3//dOgbU5F7GkQQXgpS+UPJhvhLGSpwHINg/f0qpm1a
 lme7VjE9GYNzJHpOvz/QXQKbkd6fad9qTAv4nj5lNMaS0vVK169Qd+DW+gYyhLbS1LH4AwGp
 bZxucvnUvCRV0tYs62BmYIUoH4zrWmqLvcbQMbHBli0QGSjFqTg4LSKQSS3RsVTlp0sNUf2F
 XC+jaZ2oyT98uV5zWZ/G/V4pRQlrLau6Z+Lf3JsOc5AHHBjg6pYa5oRrGNuiskydvflGoCoZ
 33jDoLe+h19nPNbkG5yCGdpDXI4XIVxFLJjX+enHf5rsTySFsBerR8rLMcSDT1wQ4EnrhHoc
 V29lPcjbV7J1f8uR64wN7yWxRjhiOP0AEfuN9WtVNze88jcrNLxLZvmn99IdM7Mw/RzpsoK+
 VqBNG03octTXqqK0rUuWRi27WXLw0ONybDRkADv/qc2CRNkEZ4yFMFxNcekm1ozuNEd6V5
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="40163521"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9K/LODDjejv+NyiBUiUx8CY9XhtZOFswgMUlOo1OrQhbp76R8IstBH3RuO6daSSvWfEnOsp6deYaLWC/JlPHhlgyDPSxF9RPx53ejFtFuLEF84rMVnlgi/7ra6oZU7sVsTV7zFTw5ZpbeFrBq3q0k0DykLyVAJaLrKtRTcEfFRmc1UFkaE6tqRO1QgbPtHmiAP94T+NTE/huusRgB57zyUFG+eHfEUzxXOCnU+hwND/uSaOwQDBMcjUHjwW0GvkDftD3iexrM97+Q2y7cpEjsZu4mfg8EAnAeXdNevAd/YTWbZSRp2zE2mWoqBZYR9+knb50I2hC4OTocG3ZzPnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw3d2v6aNIIWAAyD1yYCNSl+vqRyx1tcom5wbgbKMwU=;
 b=cTJNNLYdTLbwRI6yvis0g7rhXczkylh0rY9T98v1ScCqTFdvKyXE1+FHFbeMAZUIze+JcN0Rxv4mTHDn6SKT6QHykq9i0VCKiln9vuucHZ4C6vgJZl1FnTmMWz7b7Led1l69MPA3UPWD4J5QmEeermAxSiBaRuqFw2PBDupUVFaVKxdRltOwRo1hk4psqHzxRVAoQsN7OcxaweMRqiDgHFxWYhbNa+GlzILgp0mHIZJJLjubS9TLV6uxxhLOR4dUjtlJtzyR5h1kc91qdZnQxu9ftHlIXwR9hVjfQWjUkojd3VC7tyKIQfRVlLBGZkkOkTYmuv10rY6HHbo8Biph5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw3d2v6aNIIWAAyD1yYCNSl+vqRyx1tcom5wbgbKMwU=;
 b=u0U2U6jbYsl3H5/x4HRNbvZ4E0LikQ44S3/9NMst9JhgwCADT7IqiyGpPNZQ+6kTay7pVGoZl/NwskdHIe2adXZshQbiP7ybr++X8vvbw3bs90Yb3DNUKxLeOCkdaIWc4lkCDU2buj1dYs/euJZit4q4GZJkl0rSJUf98nn21cw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] intel/pinctrl: check capability offset is between MMIO region
Date: Wed, 24 Mar 2021 13:17:44 +0100
Message-ID: <20210324121744.58324-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a2910dc-bf35-4ec7-6a16-08d8eebedbcf
X-MS-TrafficTypeDiagnostic: DM6PR03MB4138:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4138BC2A7870745C878CBC9F8F639@DM6PR03MB4138.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NxGIMfyO5R/mAl2mCczXWgAxkZBwN8ngLFXwCmxQ2f3f4ZbBT+4bVz81FqaBi3OhseT8YIjbh37k83v3V/Xita5+ktFbfPDaKk3IggSgHH1eISwXenQU1QXZkaeMkNIqqkiSeN37rzi33MhmvJpl5qbSH08lkY63e4ek1xVTB3rNlWtn8q2y1w+Bmn5FXxJ5ts9sNbASvv7O3RHU6O+rUfmErWFRI0lmQXODzQJOgUMA6unlJeOA3L8nqZ9YLxiGGuMkKuHuDwzdENf8gK2SG6dQ5na78vUtOdeLCvzRFe6c8Pw4BPYantZcNpe2Wva2oSB1I5Ng24t5jV8ILjwqd1Icyj/DqTkBUbRDh7DGbwb7rnvrs6UAp3bp9CoqThQ8nFFbp6fCgeERWvJEZt7bQZUI25Tt5eBhBMyMRKhMaXHG4HjXzuvoAK5r03zbfSlOaa02kLUt08GsPhbQ3e6y0nx8T8Cwo8Ug9CBoMPMUmt93sD2q5zjzVh/Rz13ozd8eWWsrs20ta8Hs4t0CoJUOT4fHooZwVi/6bYPkMSiRPKqc03MmaMTudbWbv0rX6X24GezWJD/0hxOWHjv82a4t6F1J8nVtkLxU/hrMK2g08epirie+sxZEuL2xNTtPF1I2evPM0D4ojhklowGZppFjEehcKoiEKDqONCw71eV1GSA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(107886003)(1076003)(4326008)(478600001)(66556008)(66946007)(36756003)(86362001)(66476007)(6916009)(6496006)(83380400001)(38100700001)(2616005)(186003)(8676002)(6666004)(956004)(5660300002)(2906002)(6486002)(316002)(8936002)(16526019)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VlJjRVNWTmMreTF4V09mcnZ4ZzdEd3E4QVk4VHRoQkRLQWhiVGJPZEhEeWZF?=
 =?utf-8?B?cW05QkhDL0N1QTF0azc1cllkMzl5MnBVTTEzSDNaRXIyTFBVYUZqMnpaamV4?=
 =?utf-8?B?NFdNcWFvQi94SHdJRU9wZExZbzhXWWNSYkdDQW13eVJ5ZStZZDJIWGIyaXBp?=
 =?utf-8?B?YldvYXh3ckpSUHFsSXE1c1IzUy8rODFIWmVMd3dYb2tMWERuWjZwME5rQWFQ?=
 =?utf-8?B?Q2VXMUJEaVpSeE1FdWpvQzZkSHRlWERjQWhUSjVLenJ3ckR0Q09pbEtqeWNa?=
 =?utf-8?B?ZzhHc0ZkKzVvNU93eWQ5KzhhcHgxUmo1enIxYVNkckU5OVkvcUYzWi93WTdE?=
 =?utf-8?B?SlJuQmphSkNKNVNoRHNRTUVrb3o5RGkvVHUrVVU3d1hBYUhTOFhOemFmUUZk?=
 =?utf-8?B?OHFQQ1V3NExpR2lBU3MzYUQ3Qm5IOW85L1J2a3RKa2l0c1ZONzk0TFpPUU44?=
 =?utf-8?B?MnNRb0dIZFNicS82aUZjaE1uOVh1MjNiZi9hVHRETTVMdFgwTTFxblQzYWgz?=
 =?utf-8?B?bU9RZFpzbFdYZnVtWENhbUNLN3hvWndOTzBzcUFoRkdaOW9KMEpuR2ZoNzhS?=
 =?utf-8?B?OU5jNnU2MFpkUzRnU3lPRVlLK2ZYaXVsWWRIemdGYkpwVFJKaFVRc0J1ZERC?=
 =?utf-8?B?RFN4c2tTMzZuRHVsM0dWNHhKa1R4cmUzWjlPZDhJcEduMjF0bDFSc2xEdnE4?=
 =?utf-8?B?MWZqMnlrckRFUHE0RWxWUHdUaTRkOGxGbnBndWJ0bXVXVVU5YVZhczk5WFBU?=
 =?utf-8?B?L21Oa1hIWVBJNEdDSWt5UTVLNDJBM1hwcVFLUWZ4N21EY2RrU2h6REI5a2p4?=
 =?utf-8?B?T3UxZFRmaE40WGRpYkNVTnlTUlFiRzhSRHpmRmZLdm9JV1ZjTzU5RE9DbFNi?=
 =?utf-8?B?b05wN2pVK3lmYTdmUnB0TEZvT1JtUHY3NlpLelVkcDh0NXFXK0E2SStoNGhT?=
 =?utf-8?B?OWFIc0JvOWdMbE5zV3BoWHdyNmRmUWgrd205ek4zeDJtUGh6Vi96UExmZjVz?=
 =?utf-8?B?cnIrQjFKODY3bUdqNGJDRThVRmJ1YjhwWUVGWW5na2kvbHRoSHhEbDJheWVu?=
 =?utf-8?B?MW9UUktFVWVoazhPWFFZdmIzcnoxODBSeG9nMlNPWHJwZmZlUUIyY2xaaXpM?=
 =?utf-8?B?M1ZvMHJ0aEZQRnlFMkd5aCs3a0JrT1JyZjFQSVBJTUlHMy90WlJubnQzeUJR?=
 =?utf-8?B?UHYyUWNBUDlrRE1jQ240TThHZnhmaVRGUUs0MkRpQnY5Z3dyVlF6MENvLzJ4?=
 =?utf-8?B?MG01U2J4dWx6Wnd3VXFseEIvTXAvcTJGYlYxL0pIbUQ4SWtJNFFkRlZob3lk?=
 =?utf-8?B?TGZ2WmxHMS9RTk5rUkZ4bXdicXF2akRZRXM2UjVVSEdnUkVJaXJmcU9CN2ZS?=
 =?utf-8?B?WHRyaXFmc3BtanR6NnY0MjU5RmpuSE8wUEJGVHR4dzl2KzJBbXROVHhyVHlz?=
 =?utf-8?B?dGgrQjBBcmpZNzFBNDlpUmFpVzFEZ29ZUlZYemh3VEdzSDh3SXBaZlovTFY1?=
 =?utf-8?B?bVg5QnVRV3o2d1dSdnpKUUVXOVhzM1NybVIwN1lVa3hQS3RRb0drSjM2UkpH?=
 =?utf-8?B?S21QOVlRMlJ1SnlDNFJPRU9tdGtEbEJwTkdQemIwQkNuaHZUTXB1cVpibnVF?=
 =?utf-8?B?bDJ4YW5mSUtKQjlHQVNyck9HNDdwSVZhVmRIQlpmSW5lMXRhSTZOazdRM0xj?=
 =?utf-8?B?eWl6Z1ZwL1R1TE9aOUlHR1Y2ckVqZVBoM3VuWnp6VmdDbkd2VVJ4SDN4ZnFG?=
 =?utf-8?Q?yPsh+QQw+c/bU7vvIAmaYfWouwFyqiV8+29N8cB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2910dc-bf35-4ec7-6a16-08d8eebedbcf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:17:57.4245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0aQh/YD2499ACgv6aBsVljD5zHyTAqR0oQGCqz5LDobXK4hgFplXns9FZNPl9nldsADaG//a+mI3p+XaYPUdNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4138
X-OriginatorOrg: citrix.com

When parsing the capability list make sure the offset is between the
MMIO region mapped in 'regs', or else the kernel hits a page fault.

This fault has been seen when running as a Xen PVH dom0, which doesn't
have the MMIO regions mapped into the domain physical memory map,
despite having the device reported in the ACPI DSDT table. This
results in reporting a capability offset of 0xffff (because the kernel
is accessing unpopulated memory), and such offset is outside of the
mapped region.

Adding the check is harmless, and prevents buggy or broken systems
from crashing the kernel if the MMIO region is not properly reported.

Fixes: 91d898e51e60 ('pinctrl: intel: Convert capability list to features')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8085782cd8f9..bc8b990d8021 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1481,16 +1481,22 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
+		struct resource *res;
 		void __iomem *regs;
+		size_t size;
 		u32 offset;
 		u32 value;
 
 		*community = pctrl->soc->communities[i];
 
-		regs = devm_platform_ioremap_resource(pdev, community->barno);
+		regs = devm_platform_get_and_ioremap_resource(pdev,
+							      community->barno,
+							      &res);
 		if (IS_ERR(regs))
 			return PTR_ERR(regs);
 
+		size = res->end - res->start;
+
 		/* Determine community features based on the revision */
 		value = readl(regs + REVID);
 		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
@@ -1519,6 +1525,12 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 				break;
 			}
 			offset = (value & CAPLIST_NEXT_MASK) >> CAPLIST_NEXT_SHIFT;
+			if (offset >= size) {
+				dev_err(&pdev->dev,
+					"wrong capability offset: %#x\n",
+					offset);
+				return -ENOENT;
+			}
 		} while (offset);
 
 		dev_dbg(&pdev->dev, "Community%d features: %#08x\n", i, community->features);
-- 
2.30.1


