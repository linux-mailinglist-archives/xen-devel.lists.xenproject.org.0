Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3AD323A83
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 11:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89241.167949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErO8-0007yP-Gc; Wed, 24 Feb 2021 10:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89241.167949; Wed, 24 Feb 2021 10:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErO8-0007xw-Cq; Wed, 24 Feb 2021 10:27:24 +0000
Received: by outflank-mailman (input) for mailman id 89241;
 Wed, 24 Feb 2021 10:27:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs49=H2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lErO6-0007xN-Bb
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:27:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c976331-fc60-4e30-b204-3cd549bf1bf8;
 Wed, 24 Feb 2021 10:27:21 +0000 (UTC)
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
X-Inumbo-ID: 1c976331-fc60-4e30-b204-3cd549bf1bf8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614162441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ihxhCmXP17iiV9w9AMaj2ft3L4iKQTPi1IbcOE4CM58=;
  b=FDxqu+FLmFLHAlFukfaalbylwpCcKaKkW8R1sfN5xpCXMY1T1NKmLc8V
   3WW4Zp4zHbT7g6no/YfprFKR/L5vxOaJsk2X+3IeJvvNV2UIWIb4X7fBR
   ZVefBX5tBVYp0p7o5LojfNkLXZP8ycXV2JE5S50rYsUFVpd/tJnizYgYJ
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oV4/Ida21fjXwEnr1BVP3xImANUPJaCuQLoPiNWByyYoeUrCBmSEBYTsuROGV/rhOdxUR9ph2t
 njHtaFKRTfkBs0VsYIPthlqcTGN2N5bAGhNo/8S/++xdhJ2eG3Orqqzqx350L1+SI7unM6enHS
 PHiCp3SdISlrqIIlg4RjEKYnCOCNwHL0GvbKW2CgPsZU+NLadz5m09PJuboXvNxWqijlN1CkQy
 C1QD7tbrj2B6FgXf10yHvBRLGAVsbBTL0AqG/A/E7Q9oIQwEDfGjJW/NrrTQddbzRigRpOKWwR
 1BU=
X-SBRS: 5.2
X-MesageID: 37836429
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,202,1610427600"; 
   d="scan'208";a="37836429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBL8+N20iZupBSdToCgC3gquntq4zsP+OGK6+x/tEh59jzkiX0rxInNcMSKgIPOgPzkbI7v9OSVQ+fYiFhGoYz2wHWTS/Ogx+YdwOrDyCH/vYPH2+kazZ5ti7VwDdKGLtKS9Ma0gfdSQtIB8vOE8FH5Rw8L8C9cew0+5dAWvN4K0vX9X9VSmSUAUhwcY0XjpOLfwichTieYit2Cy/p1MSUveJoOHnlLf8HGSgUiM9CKcKX8aF8fXWbT2fuifhusGRDAF+Hv5D7HdXvwTTzinE3yoB8V74kw0K65TwnwAxJyFSRWsLYG/J2ECeEj9f5Vj5BgOZAKoZD8ewG7JXetIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9KAlhoh5CiX9e/mbxtnN8i1nfHbreHNEtSEGhRcJjw=;
 b=YEA7xs1+JrRvuyXIKyRgytQvoeg5V3lchfgJB9MuYqikwBN0gjnxLJPTdYEoMcCymSA7zP+YJXmcNuL3TYVcY7RhHvU6SO3HO2GrNNQMWQBVttCjpmbxnP6sJ2i14ghQ9YBlbGVjRNipmrsUe13fehbiOAWKwduWm/H0zxpwAp3Qu7v6k5WhLWVlsgKw0RqAKFaA8EJ2J1/DOH/99rY136RazVIUf0u4RGba3VQePIbAirWxhS6DNNy6L3IN+hqK5yJCgl21RcRG9pPQndS7Xhso77j5D5p3dmmPnYsk9Nypj++JuGBR5s05uy6Q8fNfXpxmlMo3kmsKlDCwI9b+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9KAlhoh5CiX9e/mbxtnN8i1nfHbreHNEtSEGhRcJjw=;
 b=smsWpfhxuCUeI8O2Aouq0BSNEmeVBT9RB3RJAZqQ+ja+FqFprQRvRepR+yLTeYQcLMqCTCCNTh3kaFCj0TEBBUgKfd9v4tSxc41weo62QXMeH3dlIl0CaLOFNg5cpZn5i6f8XW7MCmGrt6ql+tTnTXYhRfKSMo6RlwV0Z0pOv7A=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH 1/2] hvmloader: use Xen private header for elf structs
Date: Wed, 24 Feb 2021 11:26:40 +0100
Message-ID: <20210224102641.89455-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210224102641.89455-1-roger.pau@citrix.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a70d12e-6fba-4841-2b56-08d8d8aec2ec
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3481BC1C6AD0DDC31C8043DE8F9F9@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: byCcV/W37FVBQLbYx+dvKXqSsQH2rbPFvhe3ZL7oujBua52m/MKIEAcBZaGvnLy6MGGZiv+ROb0zrm6PjZyFw8DUt5EENxWx8IZBn46LbeCE1/L7kp8yKTCBZEljbd07H9SqP4s2knrdB5m2L+kZpCFPKONN7XZIkzI2sSTul/L2YpWuzv9dv4xZpD43BkY8ts3IC5Zp+ildn7ttSITHJ3CbwkQUhmYT0reshbDColyk2gihw8bsWyuPLsE4kA1sZbsTxpziNLClmWQy5OCEpdGaWDwbtzMDi1jEuYrAdhTDQiwsC5QUaz3l3UoicrHZ49/6FoDY6oV1LeahSNNA8Ko8iDALEQKj8To4NdI/Sgv4jbvdQ0y9Gg/4DddQrWtfYQAU7yHZS+qX/3FTIWTy7fy7iGP9y9olWTQzLCbM6IZh6uDwrsJd0Dl1bWKQK9aQTwK6zyTuPzUQSBxdzqoqkDm+CURQTGY30C3/ofHBDLc63Jny6rnxqY6rnC6sKOp7bbYPNI3hXnzsG+sJxWRKWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(83380400001)(316002)(6496006)(1076003)(4744005)(86362001)(6666004)(26005)(8936002)(8676002)(5660300002)(6486002)(54906003)(478600001)(2616005)(956004)(2906002)(66946007)(6916009)(16526019)(66476007)(36756003)(4326008)(66556008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OWhDKzNQVlFZK0MyZlVRbEZXWnZVMjB2SEZPWTN4dnZVRWRHWWo4dmVQMGZv?=
 =?utf-8?B?eHAvMEpSUUcyNDNXWXNnc2hwck9zREErRHNpb0JaMCtwN3BRc2VkL0RkQ3ZF?=
 =?utf-8?B?WDRya1d5U3JwR0lBdk9aSWNRaHFwcnJuM2ZuRUVDcy9MbUlnVlN3SVA0a2ly?=
 =?utf-8?B?QlJrdGxycEFrVkpoUEtBekdFNFNCT05nTGFoNlRrQVlFekpYODRnZGc3cGpO?=
 =?utf-8?B?TndvV2FsSW9UR2dpWTRUeDkvYy9rYytKNkJGTEc4SzFoL0pVN3JVQWpmSWZ4?=
 =?utf-8?B?aVhWWGlxSkZNcEM3SitKVTlFTG94enoycFNlYUt3em8yRkY5VFB6V1cvRU5L?=
 =?utf-8?B?NSswUk5KcnA3WHR6QUREdlNUMFpPalRYNUI4SllPVjIwaEUxSUh6bVVOQ1N3?=
 =?utf-8?B?dHhCTjlaaGVOL1dBdnhIaTcwYVJ4RUdUbDBpdStJK3hpOU1xSHNZUGc4V0xt?=
 =?utf-8?B?UDZONzRQS2FxMkZHZW12VXFqQVFHUjNYLzFMaXpJN2RuZ1paYnNnVnFJNHhh?=
 =?utf-8?B?cEh1NWlCYVVGSExWTTVxU1d4eVBCbjhrZzgyb0EvczkzTFVtUkQweTUwZ2pF?=
 =?utf-8?B?SHFzdmpSU3pXeW1MS0R2M2FFTHpWYUNmR3B3R1diRmpPSWVBNXpRZzArWE9n?=
 =?utf-8?B?VUhVZkdxTGttM0FtbXEvTkg0WVRzNWxlYWZkemFBOGpKRnhnZnI4SHY5MGpp?=
 =?utf-8?B?N014UGpKeCs3dHA2R3Ftb2NXckwyQnozZlpZMUhkU0NyWjFYTzI4WkZQVmVN?=
 =?utf-8?B?YXREQzY2cFcyb29SM0l4Yy96RjdJWmV1VWJwZTFNM3lXNnBBeVdIZHpNcnp2?=
 =?utf-8?B?K3FMU3g5TnZlTWZoNjdPTlhyampvSTFUS25GMnA0OGIvZWJSd0llQ1doWGtm?=
 =?utf-8?B?Smx3NWtRZnhGbTRvNktId212OFRPR2ZTVWN0MjB5OHJjbUtDLzdnQ3Fkclc3?=
 =?utf-8?B?cDdqNXpGeGxWSHZjQWhzeDJPZjNBU2owa3lUbE05Sm5EWnRBemh3WDlNRFkx?=
 =?utf-8?B?ZTM2QmxyRExKZUxUcTJESkhNNm5EOTRxVDNyaTkzRThseXdrTkpudnQzSDdL?=
 =?utf-8?B?ek8waFhZTi9ENFJFM1BxV1JHVnlEUGcrZ3M0RTZRZzRKSWZPQmhXR2VNQk82?=
 =?utf-8?B?dkhGWXlyK1MwMExoejB6Y0FPRjY3Q24ySzdzTzJ3NUxaS3VsaWFVVFVlTTNV?=
 =?utf-8?B?UE9GMjdpZ3U3d3llLzM4bmxOSkt6MmFlT2pnTURQck5SN2tnazFYQ2E4N3Zs?=
 =?utf-8?B?TDBRV1dXVWJJc3UzckZFcjdYS1dwcTBuc0d0R1FxTEIzTUFLano5cVZYKzJx?=
 =?utf-8?B?cDBhbTdIaGMzQjVCRndOaVhrbmpPWTM4T1NqYW1OYVVQN2JkU3JoTExVdmQ3?=
 =?utf-8?B?RVhyYTVERHZBd3llaWpQUVlaRGRNcW5YM0tSTm1wLzdsN2RzQU9iMHFCQjFw?=
 =?utf-8?B?bkNjbHBaQzhSd1VMZTZkRWV0UlBYcUU5aXk2MEsyUEdjYzBnR2JTTExsTG91?=
 =?utf-8?B?ZjRRVHZnV0dVaFFOR2xiZG1GRUFtQTNkR1dhUTlqZDMxa3AxZG96K09oelVw?=
 =?utf-8?B?Ujl0UjBqVTVqZ1dKaVRjRUNybkxtTG9PTzhidVl0Wmx0TXlzVVBjOHJORWw0?=
 =?utf-8?B?MDBvdWY4dk41bWhPRlFjNWFlS2dhU2RiL0NBcDFmYU94NGFQdXU3dGtBTmVW?=
 =?utf-8?B?UnZSTVBUenhvUjZYQ0dReHBDV3ZXcVdab3paY3dVY1MyNld5WjUwRm5JTzAw?=
 =?utf-8?B?cjhXdVAxTk1BVThQakVDUDhTYzdUMnlrTVhMZnA1T1M3NkplZDdxYTl6TlFX?=
 =?utf-8?B?a0owSmxlOWZLRW9iSkNzUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a70d12e-6fba-4841-2b56-08d8d8aec2ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:27:18.0236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMLkbyDIu417uHg6z13uLiHKdXagB+B/tbuQPvGy8XIkpckMmyT06ZBm1wHVeH5zpib32rKOj+2CrnVO6ZxVZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

Do not use the system provided elf.h, and instead use elfstructs.h
from libelf.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/firmware/hvmloader/32bitbios_support.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/32bitbios_support.c b/tools/firmware/hvmloader/32bitbios_support.c
index 114135022e..e726946a7b 100644
--- a/tools/firmware/hvmloader/32bitbios_support.c
+++ b/tools/firmware/hvmloader/32bitbios_support.c
@@ -21,7 +21,7 @@
  */
 
 #include <inttypes.h>
-#include <elf.h>
+#include <xen/libelf/elfstructs.h>
 #ifdef __sun__
 #include <sys/machelf.h>
 #endif
-- 
2.30.1


