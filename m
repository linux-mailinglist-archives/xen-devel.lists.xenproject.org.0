Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243860B025
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 18:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429245.680148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omztm-0007T7-4V; Mon, 24 Oct 2022 16:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429245.680148; Mon, 24 Oct 2022 16:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omztm-0007Qc-1J; Mon, 24 Oct 2022 16:01:58 +0000
Received: by outflank-mailman (input) for mailman id 429245;
 Mon, 24 Oct 2022 16:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmwR=2Z=citrix.com=prvs=289ef416b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1omztk-0007QU-DJ
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 16:01:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bb8a6a3-53b5-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 18:01:53 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 12:01:49 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 16:01:42 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Mon, 24 Oct 2022
 16:01:42 +0000
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
X-Inumbo-ID: 2bb8a6a3-53b5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666627312;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/7YTJ5jtLxHhn3HvjoLJ/O9AjcKjyGb6Gk+fqzzE+pw=;
  b=clOHfEqXXoZ1s+wpG6m0KprqMhweYiJ7zMlMnbYp2Y6F+/eGThqmDEYN
   QTNqTF8ABw40WrsaFzlDPmkCLUaavOPkBPqVZRm2YCfRwFcxvxEThXdlK
   8TfXOyj267k3vIAWdYs7H2/sbAnBqZ5NfXfrl7sfj4Qp2Z3lWMuGn0vxS
   o=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 83812020
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uj8DcaBKerwQoBVW/z7iw5YqxClBgxIJ4kV8jS/XYbTApGgk1GFWy
 WAfXGuFM6rbYWKhetwnaNyw8UxQvcKDndRnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K6u4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kdB5wC2u92MF1X3
 vATJBsvUAKii+G5lefTpulE3qzPLeHNFaZG4zRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAH7gvK/cLb4ECKpOB1+KLqP9fPPMSDWO1en1qCp
 3KA9GP8av0fHIzEmWPfqij07gPJtR+hBK41JaCHyqBj0GC2+0M9FT8Nf2Lu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQXO
 kShmtroAXljteOTQHfEr7OM92rtYW4SMHMIYjICQU0d+d7/rYovjxXJCNF+DKqyid6zEjb1q
 9yXkBUDa3wopZZj/82GEZrv2lpAerChotYJ2zjq
IronPort-HdrOrdr: A9a23:xEoub6w/3Gw7oD+TCBuLKrPxt+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvXRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIG/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF9nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KNoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFrLA
 BXNrCT2B9qSyLaU5iA1VMfgOBEH05DVCtue3Jy9fB8iFNt7TNEJ0hx/r1sop5PzuN+d3B+3Z
 W1Dk1ZrsAxciYoV9MNOA4ge7rCNoWfe2O6DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.95,209,1661832000"; 
   d="scan'208";a="83812020"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoedF3Z1Ji+DlkMs+ZEeWBDgZmHyIv5WJzH3t90xr/nQDhncZfq2U7AFkcDVopSvo7W6J/G6+JB6LGwSk9TIiRFPzrHHPnyfGUNwFzar/5OKguF18jisuKHqYJkVBNZ1v+j09QbBUvMnvZ3ofmP9wze6DyqQJEHFRF5RFid93NGwIzej0U8bkN+TUxeHLa2ZlKqy8TKDycx3rKgHclHZ0wUyE6yHsVd+4nUktMnpJ3pbyuYTwmsIPozu6kz6wGHzGfeOLnhl/B/rr6byUCvDYt6CF/4nn/wzlyaD2+2iZR9Lm+swSHYBm3sN54C5b8kFPf4Zq1z5ZcvuV/r8/KauLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAJAk5Sf/jyvgnBaKzr7y6t3VDPFMx4lhZjIXYCMNJg=;
 b=hC60zy4G/UeEK85msF9Cq9x7wAIx2VARhR572NZPqPa/f6O0amBzCinFg4flNq/JFuUuorHw+/8Ki6aIqN8+GBCZDKmEvldwXBdHGKAAYBe7mf1JcX6faXym5iTW2c6gR88WodUgERYR47BnOHyajsostXBQT0nO4Lso+EAiCOLWCb6MTwsJ6ivmBSmDQimYLytKvJen7v6c8sZCbX4dXSLoEKDfVKwzjvtPH6P0jkW75y6ugRo4KNsiN42EWxIB5zh+MDNhj084ISlSAV22J2rIS984u2ANQCCji8XxohsmiVtCL1O8C2/0O9j8UVmlDAHf/jJVkLIxFq4H37Vk1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAJAk5Sf/jyvgnBaKzr7y6t3VDPFMx4lhZjIXYCMNJg=;
 b=cIkfBEj4L55CRx/SmtjEvv5SSgknQz170EJ6bwY2NTj26wwiniPWw2mxmCQ+iK/getUyz1bEvmSrT+FxPNG2Kv3b2SU/MkRxDUldl9DYviXBI8P/7t+nRpJWpXGMBTYunY5TFKxYtkcLechBoKgQlf9vdnyzoS68hVR9H3oiPhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Oct 2022 18:01:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 3/6] vpci: don't assume that vpci per-device
 data exists unconditionally
Message-ID: <Y1a24cSD9zVZFHn/@Air-de-Roger>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-4-roger.pau@citrix.com>
 <ff8559d8-12b6-9218-94bb-8c9a731250a2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff8559d8-12b6-9218-94bb-8c9a731250a2@suse.com>
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BLAPR03MB5458:EE_
X-MS-Office365-Filtering-Correlation-Id: 286b16c0-2a32-44f7-532a-08dab5d90ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dk4MVID+iKa96TWBizyiHKWACLj2G5Hb2zuXyEAWmWVNB3FPwCTDG3AyO/rz8hTuLU8c2fmwHfmFsStRNJDSL3tD0i6Vs4Q0OzxT8X1RuPfz3wCco1v0guAAw+qf2JlqUhnH0aHxZFI2WgQkWWspwAzgPAArK+HusrOF5WpHb2fwFCsEXTaeE7n48eyaKNBmug4KwqmfaJ/08n8GokSV1c1VvxZvmv7iW+UTtPccCgrS/WnI9FROQhY2rYprWuUPfNPaw8TXS5dPgQXKTBc2oUlrXaHAu/2gBbsf72wC7gcuaJfgPvn6x/81uSAfR9sbIO8Qmy0FZQV8uPPthOsDM0juJnAPtOyUbQ+H+wdXZ4UPDN8SJ8lk2qjFminc7LHsKhjVwBLduwUhaS0BXzBo9hpSZcC3yOSEMf74z/Vv0wDzFBw7RaZltIGMDfEPrQsCPAMdYnU4nITHV5FjvOr71lB8qKZIgdMCAfINBOgYRK95r0aIIjhg+2Dwu23yj7YbldAxbHCilgAAoxkNiVEZZuB0JBCVGmkQmXRyd3r5hr5VPSKB9xkdQKS8CbGCWJ2Oq3TcCU/fEqApoCPNDMEXR45S7rcLpmNpgOwCzNh/VbhKn81lrXye1+IBMrMAjwT5Q/nTkjJtWPj5QrYPoaeJ2WX5SNTFuYRgcqXYXEzLAJPtBPtHZxZr+0VEvo5gLZuYpA/PDvmotDznd/jHoO0Ucg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199015)(6486002)(478600001)(38100700002)(83380400001)(33716001)(53546011)(6916009)(85182001)(82960400001)(186003)(66476007)(4326008)(66556008)(8676002)(66946007)(8936002)(9686003)(26005)(6506007)(86362001)(2906002)(316002)(41300700001)(6666004)(6512007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGV5VnVFUGVJQVk4SUhsMk5wdm0zd3pHenE5MHl3cXdxYVhjaStSVGJLTlB4?=
 =?utf-8?B?Wk10WTFFZjVFeHpmZk5lTzVXZ2R6Y3R4VDhiSzRZczdXMTlsbXpxZGhKS1Np?=
 =?utf-8?B?WUdGcmpqRFF0UXZGaFlYSFlRRTlUaU0yVGc3Yjc3V2NDR0tTL0VKMkI2N0t4?=
 =?utf-8?B?TEcwd1dYUk12ZWErOC82M3B6MnhEOUNPMitpSFBJN1VrbUtsSUF5UjBtN0ZD?=
 =?utf-8?B?QkIvMFhUdlV4cktOdmNoajk0THpieDJBRStaajBQTEcrMFd2YWN6L1J3RWxn?=
 =?utf-8?B?ZytQNHBXK3BESkpRWnVDbFEyS081QXJsS0RXSmlJRGNqVjdhQTVTVzEvVk1M?=
 =?utf-8?B?T3pFZnZKNDNwS3drWXROYjdjMDYyckM0YVJIMVZkem1KSWptS3pXVlc5d2pl?=
 =?utf-8?B?bUV2SVh5bDljYWsvYTJaNmIzQ0dUd1RGbVNEbHQrQUovT1JFVGwvKzM3NUtn?=
 =?utf-8?B?NmcrckVERlVnSHNjVG93TytRZmZVQ001N1NYSjlrU05KbHN6V1JMSDduLzVl?=
 =?utf-8?B?MEc4U3ZXZGcydXZ1cHR4d013VDJCU2U3SDRYT2tUNDNrU0JyWEI4Z2FKczEv?=
 =?utf-8?B?b3JFVG5idXVXeFhvWHlMT2drYm9RN0VMNlJrTmJIL3dYNkNhYnRJOFU2dXh6?=
 =?utf-8?B?ak1zQXRCRlN6aytUSWRPaEc3a3YwcXlNblFuVzg1WkFOSlBuZzhGTW5KZ0d3?=
 =?utf-8?B?LzRkUjFlSFplYzdZTUQ4anBCV0VPc0ZORFNFRjBUMzVtUEtjcTB6ZjU2WUtC?=
 =?utf-8?B?SnpPM2JwNTc3bzRXWEhpV0s0NHJUZ01OWmNYeUVtZzNFWnh0V2o1WGpEWkk5?=
 =?utf-8?B?Q3ZRSExIaExkUHloUUhMMjViZWR3eXVkYUZZOUo3M3ZTdVNpTXpLTUVocjha?=
 =?utf-8?B?RVc3S3lmcEE2TUwvOTJHY1dVYW1BY2JLWG5FWkpVOUI4clFrMXcySW9sOGhv?=
 =?utf-8?B?SjRCRHc3YzhwV0MzMlBNNDZaMWkzbE5WbzZoZFlJd1lTYm5KSlpaNmUzTDJk?=
 =?utf-8?B?WFJhUEVIWVduTUFlZDVGM3ZGNDlCUDZaZVU0KzZuYkQ2ditNRlc5Ry9Xd0R3?=
 =?utf-8?B?RTVxc3ZPa3dRZ0YySWpXcVpUMmhxZ0x2cGF1YkxPSGc2a21LSlg0cnRibzRL?=
 =?utf-8?B?VTFNcGUwWWQzeVNSckhPWmlSM2JZT0IreWlXZnhoRVdhcHp5eFFMQm5hZ0hq?=
 =?utf-8?B?YlgrKzdjZlp1UUk0Z0hwVWNFbFN4VjFUSW5sU0xhNjZ2a0IweUFpQ3FNSzBj?=
 =?utf-8?B?RjNxUjBscnBhSmxWekYxQnFXR3M0KzFWTlFrTmtWWFp5TXlWUUJoRXEvMVo3?=
 =?utf-8?B?dGQzdkoxNlQvVlpERnhvZzV1am9yQi9oUHd4ekw1VjYydjZGM1pqMStvUXF2?=
 =?utf-8?B?cWduZ3RoVWsxVFJ0Zm1zRWMwTTQ3Ui83RkkvdUtNeGZCVWhWQjJLWGEvalo3?=
 =?utf-8?B?SjFaZjd2bXJoUGdMUHdEZGo4RjlIMW1WUDEyS1lybVlXYkhBNkJuTy9BZVA0?=
 =?utf-8?B?dHlLV3pRZHpaQlh5RkVURVg4NnJjSHdIYUFML1BUbUovWGQ4WDBWNDRtY2VH?=
 =?utf-8?B?WFBCU2VRdGhVdW9VNXpDa1NtdlkydXpyVWlNQnhKS1ZZR3FQUzkrNXRTeGhR?=
 =?utf-8?B?TTNFV2ZqcmY5RHdlNUFGYUVUWFhnVUd5cVRRa1hoZVZHSXFHeEJUbWltUU5L?=
 =?utf-8?B?WUhRMkVacjAvazRGTFVTMTBJTG8wSnk3RHVPdFZTR3RHWmVaWkZSbGtQbElE?=
 =?utf-8?B?dnJYQVd4R0NIQVlERlgzaEF0TW1waXVIR1dZYVBhR2d4ZVFjRDdwRitFTkZo?=
 =?utf-8?B?TEVrRVNzWE56OUx0bmxhRWdLNXhqSzJpMTJhakFuaEt0eDNhaE5HZC8vR3Va?=
 =?utf-8?B?ZDhDUVJiMkwycTZjL25HTlRjdStSSXE2QVZSV05oVDFVYlEwSzJTbUJENXlN?=
 =?utf-8?B?bVhDOGhTQ2pFcnQvR0tscWVKV0tDaUlPQVI1a3d6UFBxRlFoeEdZeDFHMkdN?=
 =?utf-8?B?dEgwTnhic3B1RnF6Q1hHWUtZOE9WdVNsQkJqMTM0ODZjL2ttSzlJcmZZSDFK?=
 =?utf-8?B?ZEZYOE1Lb2NJOFRDYkdDc2c4WGdpcnBxM0pNQVBPUDdCSVh0cmdvaVVzclkz?=
 =?utf-8?Q?1kIFggKBRDJ1AvGyFyrEcwKp0?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286b16c0-2a32-44f7-532a-08dab5d90ac6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 16:01:42.2458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxeXroy6bp4j5Iv0rmWChA/iYfjKpJt8LM3Y9j/0IXx5XfrV+tZYQAqQhFlCf87CuGGivJYmXId18ksLaNBu0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5458

On Mon, Oct 24, 2022 at 01:04:01PM +0200, Jan Beulich wrote:
> On 20.10.2022 11:46, Roger Pau Monne wrote:
> > It's possible for a device to be assigned to a domain but have no
> > vpci structure if vpci_process_pending() failed and called
> > vpci_remove_device() as a result.  The unconditional accesses done by
> > vpci_{read,write}() and vpci_remove_device() to pdev->vpci would
> > then trigger a NULL pointer dereference.
> > 
> > Add checks for pdev->vpci presence in the affected functions.
> > 
> > Fixes: 9c244fdef7 ('vpci: add header handlers')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I wonder though whether these changes are enough. Is
> vpci_process_pending() immune to a pdev losing its ->vpci?

I think this is safe so far because the only place where
vpci_remove_device() gets called that doesn't also deassign the device
from the domain is vpci_process_pending(), and in that error path it
also clears any pending work.  Since the device no longer has ->vpci
handlers  no further calls to vpci_process_pending() can happen.

> Furthermore msix_find() iterates over d->arch.hvm.msix_tables, which
> looks to only ever be added to. Doesn't this list need pruning by
> vpci_remove_device()? I've noticed this only because of looking at
> derefs of ->vpci in msix.c - I don't think I can easily see that all
> of those derefs are once again immune to a pdev losing its ->vpci.

I think you are correct, we are missing a
list_del(&pdev->vpci->msix->next) in vpci_remove_device().  We will
however have locking issues with this, as msix_find() doesn't take any
locks, neither do it's callers.  I guess this will be fixed as part of
the lager add vPCI locking series.  Will add another patch to the
series with the MSIX table removal.

Thanks, Roger.

