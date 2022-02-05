Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852B4AA80A
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 11:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265955.459553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGI9A-0003cL-O3; Sat, 05 Feb 2022 10:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265955.459553; Sat, 05 Feb 2022 10:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGI9A-0003aJ-KZ; Sat, 05 Feb 2022 10:18:24 +0000
Received: by outflank-mailman (input) for mailman id 265955;
 Sat, 05 Feb 2022 10:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acBu=SU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nGI98-0003a8-B3
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 10:18:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef63a3ca-866c-11ec-8f75-fffcc8bd4f1a;
 Sat, 05 Feb 2022 11:18:20 +0100 (CET)
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
X-Inumbo-ID: ef63a3ca-866c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644056300;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=2M9egmCI4HzA9LZ1aBDt/P1gEY3wNlimUe6nb151H7M=;
  b=Aoq8t8yyk1sXAqnvSfeuiLzjHmG9X/MxJm/UiVBwTcSx1RhVMbd2m+sh
   lh80Tg5SxGUjvPSsb2bf5jcMx4UxCL4t76DtWd8zbvHmcpSR6kUJtdMNb
   +3NVZHUEt62+fleK803phEtrWpQj8P0WyXdW6IQu5JEMpYwu/kZDLtB2k
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vu/wimMayj2EusvVM661aDL50nzLQa4XmstURWNMBYZMFI89q4+vAeOvO+dx1tw2bv1Y8KGOwp
 v0vJrR6P2cQG4u6LOeYeuHz+afUAT0JkUv/EnNN3EppXj4cwpYpmY42e/kzSAXjZZf58z1VVQh
 y9DiKMLTImK2vwADjrAppMcpKKpuECHjq4QykBVWlMXMV7UjvboudaqNU5lYY6RzSQSLy2rUT6
 SV38sDXxI8GCI/PpRrX1sGrGwOyyUzCkTk1f7ahCcMIBm5wcnMLu0HMl9SWlPCv7HH0ZP+y+Cy
 MHIl/gno2KCNugCgKXvGx6gx
X-SBRS: 5.1
X-MesageID: 63020098
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/tJ6Ea4LJ9C6QXeVE/LcxgxRtN7AchMFZxGqfqrLsTDasY5as4F+v
 mUYD22OOauDMWGmKY9/b9i3pE9Q657SytAwSQNsqywxHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 dBO67ezZwATAKTrvu83cD1+NjFRMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxo3JgWTKa2i
 8wxbRdzMBf+Pxd0B1opBtF93+SI10WibGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6ar
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlahux1CcNl+FNcE4SarwYD3xyC8FkcLG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzEJrVml
 CNc8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdwIuGkhexkxbpZsldrVj
 Kn74145CHh7ZyPCUEOKS9jpV5RCIVbISbwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uZLAPyT9YelebzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dRPdABRcylnWsyeRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQikLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:o7yWc634t4TXsDpENR7fxwqjBVxyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJk80kqQFnLX5XI3SJjUO3VHIEGgM1/qa/9SNIVyaygc/79
 YfT0EdMqyJMbESt6+Ti2PUYrVQouVvmJrY+ts2pE0dKz2CBZsQizuQXW2gYzFLrUR9dNIEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfTHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+02VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qb5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 129lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ9o+a87bWPHAb0cYa
 lT5Jm23ocUTbraVQGVgoBX+q3jYpxpdS32AHTruaSuokxrdT5Cvg4lLfck7wc9HaQGOux5Dt
 T/Q9VVfY51P7wrhNpGdZw8qOuMexrwqEH3QSuvyWqOLtB0B5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.88,345,1635220800"; 
   d="scan'208";a="63020098"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLzjjzEfAAtNXh2YIi58GFXnJh9GsbLa4VYhA+V5t7X1UBcR32sMeXgiPt8fVntIJD7Q8vZzQDekjt7y1EUCTkDmwx27S4yHZOhr329lxlIoAyxN5uRoChB9r0+JUSFX8Z64fP+XHao3RyyEJToNP651S6KFn4NgWjbUBB238C3EGzUIBq+GsM1jBRpRttWcen/sFKVZakJAIbb/1VZAb8j+mqGutWsi52ZfPvQOvLH8zs6YA5CfMq0sPy0x0HtqmITSierBrkFz+Rcf7SIecSvfiyYkrobS0WjJyDteLtaHjNa5E4dB4VKokBG/T4C7OqHlvzj8PN8qeKj9cV7rVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVTS8os2R3JAl8Zb/Mnli4SsMsV4iD+DmljA87DcI6I=;
 b=Pbk1y1L4IPdctph+56vSxg2VVYotDV0Em5AOXUr7jcsQ+TKvVFwnMDUkRQMVkEgeDiPbsPy+ctwXkvB996LTum7w+r8QbRi5vX5GvPcLznCG0+FUlgCLE1BrH/lpgq9J1aYSPwTs3eB/uvH9VABus3jWCTLai+xStJ96aVScafGd2lFJkCp+tUnCo4fxWU4p834CrX+IoZSCkChYXHyi1y6w+nS2KnFKFI3WqbgFmdA/q5WmJXFnYmR00PXLlvCbMPE/xcN203NAlR+bnpy2owLcULXCmTQJTEYlaGyKX7UOYlFT3yJ5TzIYpvNXpSKBMN+y7ZuQeiJbbEaOYLBt6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVTS8os2R3JAl8Zb/Mnli4SsMsV4iD+DmljA87DcI6I=;
 b=AGhd4rt+88sv/0DHlYyMeUCdkH1XpBN7r0pOWucckxDZFZq7nSE0c7Oyf9ijVQDgguVd2uPgORsuC3d4eeaQ1BIxYC50el8q3sq/OaOUMl/4vkPtwZUPL9DeCPJ7cfx0moJ3KtwK17nt7Lp93JQ7Pj6GdqQqUwRv2tRhIM0xbzs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] dom0/pvh: fix processing softirqs during memory map population
Date: Sat,  5 Feb 2022 11:18:06 +0100
Message-ID: <20220205101806.35927-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0198.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 613b5d61-3e4d-4aa1-c729-08d9e890d06b
X-MS-TrafficTypeDiagnostic: SN6PR03MB3904:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB390470363998E17D73A894808F2A9@SN6PR03MB3904.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RS/yxsYhr0ZQCfuMspWQh9CFMgEYU9zEUfugH1vrh9doB3cScN4Idvpu2nvqB7JBTciZtkzsgiOgkb7RjvP6IWJbCPEFIZPpy0EhTqCwW3RoAfYgDoMRtf+RAjpGVUYVE6Nue4vohtPOlSdAvD8TvqKkdEDypfakGF8U4wPdhDst6l4UN5WVnU661zDtemXh2ow8s0NzMpfMlVGWj+NA9TUfWSlL0f9WLgj8/i1wScCMToFhVGDbRN5g6JcSEiiD0xbzaPukoz32JebDlNioKMgE+BRCSWgbjbL7Iq8L2/QsDhhhjt6gq6qfAYw8H6GGFa7eO4wvs9DKrYYP9qxgKLgUGZDwuG9qdqlbDf0v+rI3kqFBOGsILZ6xyZyQWiB+9sbXpU45r0AE3cf+f1JZSTHRygq0/DG9/4/XKw8MK4DPmmKu7a9amvLnG+8OeC1/IysrOQbj4Zv4ZEiphvr0yRPGT/vnWroPjqYNbLQM+xt6cXGO7fjgD+VpUgxk+fNKs79acFdeCizguc6OMVTQibPHSM8zxaRhMZQK8Fm1S1c/tk9xa5NHCKTwY0aujaXxvFc1Z9F4AuwoulUOd54CjAw2ywPqwuf8MelKpQ9slm6xpSP1Fn6jtWI66Sj++l3AwfdDn1+ppD4qpaB+9Wflaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(4326008)(83380400001)(26005)(82960400001)(8676002)(38100700002)(66946007)(5660300002)(6486002)(66556008)(66476007)(1076003)(2616005)(316002)(6916009)(54906003)(86362001)(6666004)(6506007)(6512007)(2906002)(508600001)(36756003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzJUK2R2UktmYWhMRUJwNlJadDBhdCsxTjlxTVhEODZ1UTdKY1greWN0SS9k?=
 =?utf-8?B?WWdMdjZWMDZERFFVWkNZckw1NzgrYnBDcFdXUWRFMWFHZkJMVnlMVlZSYkNv?=
 =?utf-8?B?YWcxSjBlZ2c1c1UyTWVqM0dCRE1tZ3lPbEpRc2NrRnk1U0p0MFVCcmlXVEhL?=
 =?utf-8?B?V2FBbmlwakZlbHV5eTBCM2R1RHgrc3RncG1BY1R5M2tiOS9rRnBjNmgxYVEz?=
 =?utf-8?B?WndZYUI4WnBVM2F1MG9lUUFVT0tUNG5CQnNGcEpTOWk0N2VqRWxrcmtWcm9z?=
 =?utf-8?B?ZmE2V1FiZ2RxK3NrVEt4NnJXeTFCaW1YdmxqV1ZwTFhUWUUzUzY4ditBQUdC?=
 =?utf-8?B?TEJ6VmRia2piVUREMTRkcHlLNUF4Rk03alJkYVB5em1VRkZMenB2ZWN2ejRJ?=
 =?utf-8?B?Y05nYTlnU2s0djREUjVHUXlQQzl5Y3pYYnJKYlNoREtPazNHSXR1eVlwMDd3?=
 =?utf-8?B?dmREV24rM2ZpSUNUWmIzak4ydnZyazBTaHpaWmRVaUtPOHBMdDBldjhXdWdQ?=
 =?utf-8?B?Yk1WQUI2OTJrT3hmUlFTVmFUMzU0VGZSeGRMQjJJMnYxUmRtVHZ5Z2hhVUVh?=
 =?utf-8?B?bWtKYUpmTkhoSVNzNnhBckNoWDhvQnVMcExyMGZtY2l2bTEraGI3anFOTTFx?=
 =?utf-8?B?N1ZJV2F3TzE2dUp4QXhDQjV6cFBvYXdDcU1qRnY0U2FhYmY5b0p4WUpKQXg2?=
 =?utf-8?B?bnNwd2J4TU9hSEJoVkxXUUJLYlQybHJuRlhjUkdnaDJjVDVSeFJIeE5xc1NO?=
 =?utf-8?B?NklqbGRBZFpMWjVkRkU0MENHZUdjS09Ia1dmN21RN3dZaDF4bTlVTUltMHlw?=
 =?utf-8?B?aWpsYUV2emNWVHpJOXR5eWZGUkhXVHY0Z0N1dmdURWVKL3RJelREV3NxYk84?=
 =?utf-8?B?OGZDWXVIMEpXeThWNFdrMnhrWlE1anN3blhXdVAxVWxqVnVTMk1wOGVxTFQ1?=
 =?utf-8?B?OG1OMU1QNTFTM2cybENGRFhkdmwzeHBqOTJFL2VkYzBvS1BCZWlwVUxLbGNi?=
 =?utf-8?B?eGxFMk5zc0RvMVVaSFIxVFozeTFwNk9SVzNYWTFjbk54eUhKSjhKMHJUUGtX?=
 =?utf-8?B?TWwzWVJ5NnIzVEFjS1UzdlZmemtYOXFNcWhhUVlhM3FiZTV2Q2lPbmlsdGVz?=
 =?utf-8?B?YWlCcGY5VklzcFBZeUdhek9SWUVKVE9rUS9oanpGMTlWVW1FVy9VNFRKQ3Zk?=
 =?utf-8?B?OHlzMEt2WGVRcnJuRk80eU9DTHBnUmF6OXhja3kyK1R3L3JSc1BacWNDN3RO?=
 =?utf-8?B?a1JxUDh1ZktwRDM4clRncTZVV3drS2lVdmZURmxnUk5RZkNhMTM1QkZMRmpn?=
 =?utf-8?B?dWFEWWQxOUtGaTFqY2JuZ3gxSmlFRXVTWE91TXlEeEtQUDdJSFR0cnBYTEUw?=
 =?utf-8?B?N09lZVhUNFVDbUZCY1F0Y2QrNG04ZTE5dHBZaDRsRUM0L2hGRzFTcXlERWpa?=
 =?utf-8?B?bXJXRFNZcGQ0SlNSM2NTTDNmSmNUWUwzdG9JM25zSHlwTFdFNWozOWZKajh0?=
 =?utf-8?B?UitKcEtya3hpWU0weGlST2gxSFFnOHhaMkMxV1hkdEswRWR0dElQTS81TlZJ?=
 =?utf-8?B?alVjTzJTTjBXalE5UVBvQi93eG1uenJaUFMrcjVjejJ2bzdTYnN3OHNHRGZx?=
 =?utf-8?B?dUx3ZHVKRExzQ3Y3K1dYMDJjeGdRa0NHTzFQSzFUNFpXVGd6djNYYUw3VjBI?=
 =?utf-8?B?VU9ObGFhWmpTenpEdjJ3c2xMeVN0bm12WkNnaUQyd3BScEVoZU1mdlA5UlpC?=
 =?utf-8?B?RTBLd01ORFpKOGIvRllTZE5Xd0RIa1VuN2hmSG10K2xkWjNxTm4xUzR3NkJp?=
 =?utf-8?B?eTkwVC9scjRkZWpwajJhK2h2S04rS1RzcGdnMFdzVHBiNnBNeWphWWw1R2Yr?=
 =?utf-8?B?TGwwTW9hQ0FCN2l0UGlnZjZVRGE4OEVCc0xScngvdzZIUFB1Q3dpZ0VENnhW?=
 =?utf-8?B?RXJpNkg2cWpiZ2pBUFNadHJQN1NlTXFMVGxXcVJ5KzNZSm1MK3c3TlhGNjR6?=
 =?utf-8?B?cnFQcVJHSUdTZ3JSUUhTTmZuK2lsU0NTM0JYZm9BRWF3YkdOUlZGQlRTLzFw?=
 =?utf-8?B?N2pZZ3hBZnZCR3NWbmtXb0g4YkJ5WVEvaWhvMXcrR21nTUs4aUxhRVRYeVln?=
 =?utf-8?B?YkNiTFdEckQ3TUQvcDJGeUpqN29ZeGxqM09YbGVTQy8xbjd0OE9ONG45Y0Vx?=
 =?utf-8?Q?d7ZQav8DXoQ+m+FGdJcX9xQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 613b5d61-3e4d-4aa1-c729-08d9e890d06b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2022 10:18:12.1493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AG5MZrrVGdXuYSZxt/YvA7eRAMztr5D/oV1bkCKzt1ysiP3deL8VHijwxynW2bCtrE8PVM/aohPNgIGwo+gUqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3904
X-OriginatorOrg: citrix.com

Make sure softirqs are processed at least once for every call to
pvh_populate_memory_range. It's likely that none of the calls to
pvh_populate_memory_range will perform 64 iterations, in which case
softirqs won't be processed for the whole duration of the p2m
population.

In order to force softirqs to be processed at least once for every
pvh_populate_memory_range call move the increasing of 'i' to be done
after evaluation, so on the first loop iteration softirqs will
unconditionally be processed.

Fixes: 5427134eae ('x86: populate PVHv2 Dom0 physical memory map')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/dom0_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 549ff8ec7c..78d6f1012a 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -186,7 +186,7 @@ static int __init pvh_populate_memory_range(struct domain *d,
         start += 1UL << order;
         nr_pages -= 1UL << order;
         order_stats[order]++;
-        if ( (++i % MAP_MAX_ITER) == 0 )
+        if ( (i++ % MAP_MAX_ITER) == 0 )
             process_pending_softirqs();
     }
 
-- 
2.34.1


