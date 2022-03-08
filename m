Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CDF4D1A07
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286951.486678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaVJ-0005NL-9Q; Tue, 08 Mar 2022 14:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286951.486678; Tue, 08 Mar 2022 14:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaVJ-0005LS-54; Tue, 08 Mar 2022 14:07:57 +0000
Received: by outflank-mailman (input) for mailman id 286951;
 Tue, 08 Mar 2022 14:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRaVI-0005LM-8c
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:07:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24248233-9ee9-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 15:07:53 +0100 (CET)
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
X-Inumbo-ID: 24248233-9ee9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646748473;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AHtsnI9q4MbTl8xVo9WoHiFYPnI0pHMqFop8RM2nF44=;
  b=AD9jDq09QEiKGM+36E9eTR4p7OfxA0qHNG4aWfgVMQLveTL8FyhvfKUW
   kxT68x//ee3A2S5qwsmpi8xO73lWydktW761LZ9z4qD1Vc7gu/MP3e84D
   Nu7wCA58k4eWwfbBiriR29QxjXTW7loi7Oo0Rbla688WXQXWUAJMc7+3A
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65714627
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5nrITatTFm8SdjZIDA7DF6Q/uufnVEBeMUV32f8akzHdYApBsoF/q
 tZmKTjSPvbeY2D1LY1xaYyy80sOvpCHndJjGgNr+HhjHnwQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV6
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8GAe7xvrU+CyUBOHB5PpBA0ZngK1aw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pVANWQ1M3wsZTVdAWgcOL4Snt3wm1+vaQxVjgOej6A4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8IFqzyrm4mM31+yV28HczhoTvssmsBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZD2AAcmV83lqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1bJhbKWKyO
 R+O4mu9AaO/2lPwNsebhKrrV6wXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLqd5Ddw5bdyNnbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3UApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:2Uog96iyDOA87oTSs5fPSoHbY3BQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65714627"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuHSQbZw1NDYjhWhM3FF4KhyKa/FePhS+bom7Z33orUks6b5quar2atLILYUd01e/exo+SW7B4ZPpfB2o/TSQz+tsH/bFEXGyQiPBj6mrIIuxVbpde/+ZYYYybWWr+rfCNs/mSVV0zsabkufzD5je6ShnkgZnq9T26z2Qxj5A/LmidtzbxYYCtBBAPoFYyH7veAcZM3wRYZ00OWmrc4tHHDu3Gbtso5hFaEBhHe1n1MToY7DHM6PJx925AyJoDPjDasngeFiQmyQwYQxFDdyg+hLrzCzMYBkhk7Cwekm1U2oHKWaEbiS2etakn+VWF4t+4EkOjhp5vQLX+ytl9z1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjaZHswrTyR4+kwDwtyQgFJTnNDjhsCfHY4wRa/Q9NA=;
 b=Sy5FbSfnichY+H59Si5yxygIQra9RAhch7RnoNV/8n/lbT/bnTEAyBqspPezpUMBHeuAlQ6NvxJLmCZQzp6br6LpJGOdsibC2HBI03t/6uVDvuQKl6KF9V6tE9e0doAUeCtqFChz1oJfuQuWNWFMYmHmJo5NHUqwVM+TsaJLSfNIWU0qz6kbOMze6BrE6SGl9Z/Rw3ogVnR10DYquQ0lzfMmroL4hvp1v5GWaxZTH53SERv/qNyecisagPuJREozH2VbNoCdX/+uWz7t+5MLSWlxxCi8AzAuTi5TAChW6k2yepw8R/5tTT694SZnWh/zr8Lfbpi/U9Gxv8EgmaoaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjaZHswrTyR4+kwDwtyQgFJTnNDjhsCfHY4wRa/Q9NA=;
 b=sfQNB62f99SqAVmI5oXNJ1r8sKu3CQIwgjTMTe0qI+8556ODYJs4sC2fZ/S3vAcsMsRcg2zHHcuBGKJFZd4jtrfzxSHTt0WIhfle0ZRNuzhZzkQwA+vbuPRCzRnPI9BkOq+zX8PPGorb8kdBNzXqRSSwCqt7+pGlJxQEv6CnCSc=
Date: Tue, 8 Mar 2022 15:07:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/build: use --orphan-handling linker option if
 available
Message-ID: <YidjLL7xiBxUNtWx@Air-de-Roger>
References: <289684f6-fa73-bf02-137c-680ad8891640@suse.com>
 <YicsK8xqdcGZYaIn@Air-de-Roger>
 <0cde8972-b357-e2c0-ccc4-a0720cfb3501@suse.com>
 <YidH9La8I4X+M2S5@Air-de-Roger>
 <90124755-cd69-6352-e75f-80a1e53c93e8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90124755-cd69-6352-e75f-80a1e53c93e8@suse.com>
X-ClientProxiedBy: LO4P123CA0423.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0638a66-d435-41a2-4796-08da010d05c5
X-MS-TrafficTypeDiagnostic: BYAPR03MB4853:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB48536022783E70DB489A67A58F099@BYAPR03MB4853.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kp6dZX4knhlqSctuoGUGiOhqQj4NIu14+kgoiNoJ2bFYUshHyzIOG9LLBRyHLYMrln8Kv16T+0etb1i3rrIqnM4r1QWkIJFiNdIZCrphLnAlDXYq/5wfcJHWfYVfgtkJlT5F1m1LOUNztK/04BnEaTJqjoMCcqlyDg1woROYS5YTGhmlnhPXmBbo4069VO2F1Z3rSOhd2KjkwyISa6kcYRUCvvOGOwucbAp5aUVVA5hQcbB+3rF5SD32vM03WQ8Ce8IaEAi/c8k7QnPhocDwy5NV2tb1QplbD4lB62J66TBWAPtzkhajQq2NQGqbRrlh38uoF7prIqJjBi2cofEOhKkuCb68gI36Peke9EhmgvaHDyIx3+A2qcju2JIkaT4GTcayOYCnGeunNLw1OfjgCd0abMtNZO/48Z7WoG4q2pmWnFzWqefO70/Fh4Pw0xKxx9uvHwcqikryFYonynZbX/gsO2rdGuu8ARWUlDNIaFUk4r3KJrroVij3GA4FPgIHfVkRGlpAXPkD13AXhJNWiDdL2eN8lVdxmr1a5pLcYh8cfCADyeofulu78GUGFfBle9PSby6fLzzCFvWzh3PAOeK61jSMgOSfZv+7Ui9GD9WzJKltGVb8eln5wqVV9gc3i/9l4LhffDi3fQ+UPsrB9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(4326008)(8936002)(508600001)(6486002)(83380400001)(2906002)(86362001)(66946007)(66556008)(66476007)(6916009)(5660300002)(316002)(8676002)(54906003)(85182001)(6666004)(9686003)(6512007)(6506007)(33716001)(53546011)(186003)(26005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2NFWXdSVE82ZmVSelRCNyt1dkhFTU1nTlJmcTMzRHBwd3NFRDV0dEF1MFM1?=
 =?utf-8?B?MTFON2NPcDM0ZWdWL2RBNjdTN3dNdE55QWpFbExYbzVNZVRnRGhreWpKNVVP?=
 =?utf-8?B?ck5oSXNZZTJTZmJnc2wzQTlaS2lWWlU1ZlBXaXpSQjk5ZUNiU0ZBU2hkM25j?=
 =?utf-8?B?Mm1rUFJtZEZsNUJvQ0d2U00xeUU0R2t5ei9HamIyWXdtL1FOMVlmU1kzdjFU?=
 =?utf-8?B?MDVZTHFZckQ4U21TR3I4NzhWZkNGakZwRjNZanQ4V2dvdUhkUngrVmhLc3JE?=
 =?utf-8?B?Q3dOZ0lxbDFoZlJNb0s3cFl3SFliWmtERUV1M0U5RVJ6VmRhSTNvVWdRc1pl?=
 =?utf-8?B?Mklpd2J3V3BVRVdXZnU4TnRXbXFDRXBRQk5YRjdyTDREU01DeWZTdXlOd24z?=
 =?utf-8?B?RTBCUFFVYkVnR2wyZUFPOHhYSklqaDduU1R4TUI1NDd2SUZobjF4ZjdmQWdU?=
 =?utf-8?B?SGJMRzd3M1Jta2dLbyszbitSMjdvQlNXcjBiaWNrQXhFcUcycmpjMGRTbXZy?=
 =?utf-8?B?bjZad3JqSlBlQnE3Q0E5ZmhpNE9vdDVSbUFxeUoyZ3hxM3FiVmZSNkFYVllq?=
 =?utf-8?B?V0dXQzRYMmg2MTBQd0xuajhVa2NRdmdxUUpDcC9jZW95SFd1K255clF5a1R6?=
 =?utf-8?B?b0YyQkU0MFRGRGd1ejFTL3JpaGNjcGRvdXJVNVNTUWJEdzE2S3lYeU9EOWVV?=
 =?utf-8?B?cDRqVHN1OUFSWWkwK2EraldMbTRqZVA0YjlPa2FnYXNqcGk1NlF3QjhtamQz?=
 =?utf-8?B?NUtQaVFoa3NFY2hycTNKVFdCUEZEOTBhRzNObmhNK3pnMUVqUjZKOGlIZTQ2?=
 =?utf-8?B?N1k2UlJ2eGEyeEloNEpubzNFWFVjcFcxRm9USnltQXl5Rm15WkdMMHFoM2Z2?=
 =?utf-8?B?QlE0MFBWOWFKMGpJMWpkNTczNFpvYlN5WXhPZ1pMQ0RvV0NqMzBvMnBXR240?=
 =?utf-8?B?OVVVOUR3T1lVNzdLUENvVWtVUTZTTHZ5VFRwTjJxaVhJMjFQUi9zcVlTUDRI?=
 =?utf-8?B?dnI0VjJOZS9neHNYRU1abTYvdVZ0c1ZHcGNrTGxYQUN0blNMWlp2MHFqV3R5?=
 =?utf-8?B?RVZOc2p2M2VoOE50czg1VjNUci8yOXFvMDlSZmpRcFBDZ0NIU0JaMFB3MG50?=
 =?utf-8?B?dklVZi9WM1ZrRzJNUXhZSzh0WDhGMVNZU3NGb1R2d0lBb1paaGYwRFZGeXl1?=
 =?utf-8?B?YU0wMlNFdng5NlhTRGU5OTVpd0Q1cFZhKzhIWnVQbVBPYnJLTk1aeTNhWjBj?=
 =?utf-8?B?ZklvaExrTWc4ZFljeHA1bE4wMTZXNklhWVJWenhzNGtDNUhSRGZyYVhRZ2lH?=
 =?utf-8?B?MzZxK2syVHliMXZhT3Q2T0JZNVFNNEVWZG1qS3h0VWR0elpmV3J1OERlb3lm?=
 =?utf-8?B?SkdYYlk1UjV4aUMyTXRwanpKVXhvL2IxNVM5L3F4N0pYWDFFVWoyRG5Yc3FW?=
 =?utf-8?B?bUlBbTA0TzJRbDRHNkdiNU9Gb1pqenZEQUxteU9MaG5tQUE4VHdsMnBkK0lI?=
 =?utf-8?B?d0JRMWxVQTBtVlMvTWhaMEV2M1VsSGVIMHV4UVFMeHJuMlBxbEpVSC9xanpZ?=
 =?utf-8?B?VWxOdFJWQjZMa2xMaG9xU2REaVBmSW56cEUyN0RaaTRncXA2MXllVnhCNnJ0?=
 =?utf-8?B?ajI1aW14VS80Zm9lcG9tK083VEVpbEgvQWhNN05LWHJkOFo1cUtaclVDUnZB?=
 =?utf-8?B?THZCaThyYW9TMm9TK3N3ZDU1WkJac1hFeTRuMnMwc1hKQ1lrTHpsbVFvbU9V?=
 =?utf-8?B?SEl4LzRheWZTSHFadXVmUUI5eitSZXhLbXdVWHdQd2J3c281Q1BLcEV5cUth?=
 =?utf-8?B?M2ljdjdUODRxbnd6NUhoOHYvUUt4S2JvQ3hDT1g2RnU0VEt3T01vSnk3QTBT?=
 =?utf-8?B?ZGhHRi9WbkVQdGRJMWt0RHZzZkd4eHB2SEh1VzBOcEdVcmRiM3BGeTZHU1Jz?=
 =?utf-8?B?dFhPV0dkcnRuSGtPNzVOOHppTGRBTzB4ZHR3Q0EzUC8vcXluRzlWU2RscmUx?=
 =?utf-8?B?VGVMZlVLSTJpc04vbjNIMnRPdWlXbDlRUnI0NmZnMngzK0tvbjZ5bmVIYW1k?=
 =?utf-8?B?NkEwL05Tc1VnUmtzMXFQaDFJVURoNGkxc2t4WHd5UFZPdzBtbjZHSXlCTVNl?=
 =?utf-8?B?VjBJb2FZbWcwRm54SXhvN3ArYzNLd1MrREh1VEhIbS85VDlldFdPRFl3NXMw?=
 =?utf-8?Q?+3FRwVGCNN3xVth+QnMedQU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0638a66-d435-41a2-4796-08da010d05c5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:07:47.0770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPWbPpjgSPRLuj3f7ISw5xV6oPY56XX8PF/qmMDU/rwvVoTbGBjEgTChB9oZZGHbw5idAWc6pP2+cqGW4HizpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4853
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 01:34:06PM +0100, Jan Beulich wrote:
> On 08.03.2022 13:11, Roger Pau Monné wrote:
> > On Tue, Mar 08, 2022 at 12:15:04PM +0100, Jan Beulich wrote:
> >> On 08.03.2022 11:12, Roger Pau Monné wrote:
> >>> On Mon, Mar 07, 2022 at 02:53:32PM +0100, Jan Beulich wrote:
> >>>> @@ -179,6 +188,13 @@ SECTIONS
> >>>>  #endif
> >>>>  #endif
> >>>>  
> >>>> +#ifndef EFI
> >>>> +  /* Retain these just for the purpose of possible analysis tools. */
> >>>> +  DECL_SECTION(.note) {
> >>>> +       *(.note.*)
> >>>> +  } PHDR(note) PHDR(text)
> >>>
> >>> Wouldn't it be enough to place it in the note program header?
> >>>
> >>> The buildid note is already placed in .rodata, so any remaining notes
> >>> don't need to be in a LOAD section?
> >>
> >> All the notes will be covered by the NOTE phdr. I had this much later
> >> in the script originally, but then the NOTE phdr covered large parts of
> >> .init.*. Clearly that yields invalid notes, which analysis (or simple
> >> dumping) tools wouldn't be happy about. We might be able to add 2nd
> >> NOTE phdr, but mkelf32 assumes exactly 2 phdrs if it finds more than
> >> one, so changes there would likely be needed then (which I'd like to
> >> avoid for the moment). I'm also not sure in how far tools can be
> >> expected to look for multiple NOTE phdrs ...
> > 
> > But if we are adding a .note section now we might as well merge it
> > with .note.gnu.build-id:
> > 
> >   DECL_SECTION(.note) {
> >        __note_gnu_build_id_start = .;
> >        *(.note.gnu.build-id)
> >        __note_gnu_build_id_end = .;
> >        *(.note.*)
> >   } PHDR(note) PHDR(text)
> > 
> > And drop the .note.Xen section?
> 
> In an ideal world we likely could, yes. But do we know for sure that
> nothing recognizes the Xen notes by section name?

Wouldn't that be wrong? In the elfnotes.h file it's clearly specified
that Xen notes live in a PT_NOTE program header and have 'Xen' in the
name field. There's no requirement of them being in any specific
section.

> .note.gnu.build-id
> cannot be folded in any event - see the rule for generating note.o,
> to be used by xen.efi linking in certain cases.

Right, so we need to keep the .note.gnu.build-id section, but we could
likely fold .note.Xen into .note I think?

Or at least add a comment to mention that we don't want to fold
.note.Xen into .note in case there are tools that search for specific
Xen notes to be contained in .note.Xen.

> >>>> +#endif
> >>>> +
> >>>>    _erodata = .;
> >>>>  
> >>>>    . = ALIGN(SECTION_ALIGN);
> >>>> @@ -266,6 +282,32 @@ SECTIONS
> >>>>         __ctors_end = .;
> >>>>    } PHDR(text)
> >>>>  
> >>>> +#ifndef EFI
> >>>> +  /*
> >>>> +   * With --orphan-sections=warn (or =error) we need to handle certain linker
> >>>> +   * generated sections. These are all expected to be empty; respective
> >>>> +   * ASSERT()s can be found towards the end of this file.
> >>>> +   */
> >>>> +  DECL_SECTION(.got) {
> >>>> +       *(.got)
> >>>> +  } PHDR(text)
> >>>> +  DECL_SECTION(.got.plt) {
> >>>> +       *(.got.plt)
> >>>> +  } PHDR(text)
> >>>> +  DECL_SECTION(.igot.plt) {
> >>>> +       *(.igot.plt)
> >>>> +  } PHDR(text)
> >>>> +  DECL_SECTION(.iplt) {
> >>>> +       *(.iplt)
> >>>> +  } PHDR(text)
> >>>> +  DECL_SECTION(.plt) {
> >>>> +       *(.plt)
> >>>> +  } PHDR(text)
> >>>> +  DECL_SECTION(.rela) {
> >>>> +       *(.rela.*)
> >>>> +  } PHDR(text)
> >>>
> >>> Why do you need to explicitly place those in the text program header?
> >>
> >> I guess that's largely for consistency with all other directives. With the
> >> assertions that these need to be empty, we might get away without, as long
> >> as no linker would decide to set up another zero-size phdr for them.
> > 
> > We already set the debug sections to not be part of any program header
> > and seem to get away with it. I'm not sure how different the sections
> > handled below would be, linkers might indeed want to place them
> > regardless?
> 
> Simply because I don't know I'd like to be on the safe side. Debug sections
> can't really be taken as reference: At least GNU ld heavily special-cases
> them anyway.
> 
> > If so it might be good to add a comment that while those should be
> > empty (and thus don't end up in any program header) we assign them to
> > the text one in order to avoid the linker from creating a new program
> > header for them.
> 
> I'll add a sentence to the comment I'm already adding here.

Thanks, Roger.

