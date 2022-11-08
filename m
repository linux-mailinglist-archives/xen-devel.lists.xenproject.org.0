Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B162196B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440286.694425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRVP-0005kv-O3; Tue, 08 Nov 2022 16:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440286.694425; Tue, 08 Nov 2022 16:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRVP-0005iO-Kt; Tue, 08 Nov 2022 16:31:19 +0000
Received: by outflank-mailman (input) for mailman id 440286;
 Tue, 08 Nov 2022 16:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5nK=3I=citrix.com=prvs=3047eb21c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osRVO-0005iI-RB
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:31:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c41bde6c-5f82-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 17:31:17 +0100 (CET)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 11:31:11 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB7016.namprd03.prod.outlook.com (2603:10b6:8:43::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 16:31:06 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 16:31:06 +0000
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
X-Inumbo-ID: c41bde6c-5f82-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667925077;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UR7nYv4wkV+moA5NLyGn+XW0mAT8ssHH92M59HG9MDQ=;
  b=dcHiaROMR4j+fkFAz+9wkuIMVINWeavAMAS/074B3nKa1UwIePcFD9HQ
   keW2lwTkZFqfjQI8DPc5BGBwF9zTdw0tAJGfwZZdQyugk8bvf9cEmAB6o
   fEDu2HVLa04NECI3yOiKdLYD+1+ZXPimjcQ1wwGY5ToBvy0RUeLuP8Rqj
   0=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 86941226
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eGBJb6umyvbpC4QXNhBzqBZTpufnVLdfMUV32f8akzHdYApBsoF/q
 tZmKWuOaayJMDHzeIx3YI6//EIHusSBmNJhGlBv+H0xEisa+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaGxyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJRIQMQ+drtiNxJmiY+19je8hIO20BdZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60b4W9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAurBtNOTefiqJaGhnXN63ExATI8eGCeqNTphw2XGO1+O
 1Utr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooL07gCDFy47RzhOQNU8sYk9QjlC/
 kWAjpXpGDVpv5WcTH7b/bCRxRubPSUFJGkOaDVCYQYY6Nnuuqk6ix6JRdFmeIaqivXlFDe2x
 CqFxAAuirNWgcMV2qGT+VHcnynqtpXPVhQy5AjcQiSi9AwRWWK+T4mh6Fye4fMeKo+cFwCFp
 CJdxJfY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 Ba7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:DKrbR6l70rZJJQ0uOGvVLGfu5VPpDfPJimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81k2dUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInpy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zUYIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6R9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF79tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcoa+d
 FVfY7hDcttAB2nhyizhBgv/DXsZAV5Iv6+eDlPhiTPuAIm3EyQzCMjtb8idzk7hdEAoqJ/lp
 X525RT5c5zp/AtHNxA7cc6ML6K4z/2MGbxGVPXB2jbP4c6HF+Ig6LLwdwOlZGXkdozvdMPpK
 g=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="86941226"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3NKTVMp1OPGkjbRed4J8s06fio1dPPg0F0DiixGw1js2jiCVNj06KU9TJqCmJu1TOVHvwkMB2IYxLT4nMbsvw6oHU+yK6/gGL+QoOL75KWzo7N7SewPhbcKzrl4Kt3Go0YyqlzI7CiiGLIciDZ4q4EaOnWs0tUMIRMS0OevWBQln0+SWKxt6Hc0u8NfNMwIItuOBICPwfhtfhhluPGQxDrPZeyUiszfo6k+7esT6OZ+THvdQAnRkcEWChFjszcrve8nSeDrxDq8/AU3F+r8iABaodrLSrKyIoXIUCBqMt3kZcUHt3ADU7y0IB5Z1UW4ykKhIP0p1LRq8dsJcUk8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCr1oadcfWGK45oMv4NUb/v6MJ1I2YBBEM82sMNZl2s=;
 b=CcAQWmtogQQ4ANqruhPFtL6vBqtTc4fbdoQpubktPiKsoP5tSKMM3dxW8BAGfAjxjDja0Bvr81jB2hnvFD2vvO1unLoaR1BjoGWlQsby5JOQBnqnmNn0MZSnxbj6Ey5vPVF32BZbhq/FsgdKb2Vx97f3AfFc/3/DNSmkjnT/YlGN0RYG5hO2K2IsK8dvUb9Lw4BqXCFD0O6K7sbeNkWRfySVOwn17QrMB6zyOWdY9oQYNZxfHMoUlESK0/scZUHVGxTFj2SCw58cYiZi4lzPTig6FfS9m7li6y3hY7PzwxB0bm0AGKoGlQ9bH9OPzwBQC4wOmnqvDzWCL3b/tvk3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCr1oadcfWGK45oMv4NUb/v6MJ1I2YBBEM82sMNZl2s=;
 b=muxOysh+HuJ37b0sFiQUEsZBgoo4hYQ7l2r3DiutPpQW62beQP5PhD1gbh0sQGYv/3pjAYXfxNM5oakKtjhR/rd2Vh66w1RtULgpptRPgQdXU3GnmcAkxE0ApZnZs4UdwXmF4myqhbUb/BtDfUcxP2SGB1O0eHp7vh6XjbJ681U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 8 Nov 2022 17:31:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, ray.huang@amd.com, Alexander.Deucher@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if
 present
Message-ID: <Y2qERaoix1Ff4yZA@Air-de-Roger>
References: <20221108135516.62775-1-roger.pau@citrix.com>
 <9b785cc6-2de1-a522-9e57-62c0421c6a21@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b785cc6-2de1-a522-9e57-62c0421c6a21@suse.com>
X-ClientProxiedBy: LO4P123CA0471.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a52f6e-cc16-423b-f0a6-08dac1a6a29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ht5Kl0UPxxj1bNGyApa4Xx4lSONBcXx7gswsmF0d6odZC9tfEsIVzQP0Gn8TNrhSXKH5KErt1A/SOuozTaZMUFNLfdvku3hTD0AHJlRfVe4IrMpJeFqI/uCHvJTGYMsW9NqXT1Xf6hpdg3YRzXoRx+IVANGxhWk/CtzN98vC9+9GaS33AIub+NEPbLcgw6MM+QypR6YMsXtyJNNLofNBLveJVETrlgmdw7aYmsTfeQGSPaqgE6YN4rTVYBF9WKpQVdnVkOxTs3/YUECjCnJbo8IsuioL3Hz3vLfi6wAitWKUMLITK3FrMA5/d5wMvjJB/qsTovmn0Qf7AYMD3bpKDPOBRiXkYRypkjuqWhvewzgqzxe1YWuK2JhMdxJk2QegbjsDT1jgILrJqT+oBGPkfkvjzSMRDGUWR1qbI79etLlv7Ijmwcurz7jRMSVsbtoKzhFDCavw8+70G812wj6OS99TbBxfvdtN2uSPxaF78OQqOUPzVe28b7rM4JB0hseJhIjbRKbwzzv1Fc8PWL/utgrMGGurnpSqfOEneW7FUqz92K/5p/xusos2duIRxH0QdpDB8U+H1HspnttIWXN50rGw+nRWt4+pZSUxgQ34RtshRgoyl+CPQvzVb0rJv8mcXZSD09zW2srZrpBoMuoFUn9EssEEtXz9r0lolv38lPy6i66V+if0Cf0pj5s956INmJ07ypBI+BqyK/VaSZ7jVUtaET95ZTWUsfTI5SbLjRY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199015)(186003)(6916009)(54906003)(6666004)(316002)(85182001)(86362001)(38100700002)(82960400001)(8936002)(6506007)(26005)(33716001)(6512007)(53546011)(9686003)(66476007)(5660300002)(41300700001)(4744005)(4326008)(66556008)(478600001)(66946007)(2906002)(8676002)(6486002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y295Z25mTVBXNTU3RWZGekUrb1RnbTdhUkExbDFQVFBoazdHemdjaE8ra2sz?=
 =?utf-8?B?ZmtrS2xjUDIrVGp1bEFOZnE3UUtWbHJreFZpOVpWd0FkdUxpelRieEtHM3V2?=
 =?utf-8?B?Vk1Ib0hOMHNPSnRkWGkvZ3R3MHF1NDc4aFB0SjVzY2ttL2xvOWVxUUNISWt2?=
 =?utf-8?B?Wis1dEdkRm1DNmJtYytFL3A0b2l2Z01IaU5LYitDb0pxT1NNMGhiQTJxZE1O?=
 =?utf-8?B?Q1BHVUxYTWVNMWRrbUhSazhuODJJUGxYeXcyZG1YcUhWQmJsYnhBbTMvdkNP?=
 =?utf-8?B?WmtRRWhUWGVUQTZReUs0OXdBdXdiR3h1ZXJkYmFDaVVEc1FsaWYyV2k5QWNW?=
 =?utf-8?B?UXJwYXRXUXFWRzFadTAyQ3paOTQ3V0x2Q290Tmx6a0J4cGVNN3lIekZMQS9P?=
 =?utf-8?B?Tit3MTVtWldjV0t3ajAwSzVTb0phMkw1MHNQRUJoMUVBd2M2Mkt0dlpZOFlk?=
 =?utf-8?B?Q0ZjdUNIODFkYW1iRU5PTUQrSGRpRnlyY0E2R3Z4ZWllcjJIb2hVa2p3S3ZK?=
 =?utf-8?B?SjBES2hYTkVkUlg2dGEzOUZZWlJmOHFjTWk0d0xWdGQ3WTNkcDlLTHU2dWRV?=
 =?utf-8?B?UWd0TFBXTTJLcyt2Mk41VW9GUzI3dVZiR3E2TTZsOHBDdnIwYm5rS0RmRUZI?=
 =?utf-8?B?ZWpscVNpeHBTRC9GejRzMDRvT292bGJiWEtyZHYvVE1uQ3pjZEFpZ0krS3BZ?=
 =?utf-8?B?VjlOTGp5YlA4MmFjQThLSnhMVGhDUDVkQmJMREVMWFVKWDErdkdFdExDcU9i?=
 =?utf-8?B?bmVUbk93TGNTRmo2SExjaWRtZEM4WjN5M0wrRDg3RzBRTkZPWFU0cENTaHda?=
 =?utf-8?B?Lzg2anBpSFhxZnV3R0dzS1Erc3U0OVhHd0FDbGcyVzJTMkJtWERVR1I0cVVM?=
 =?utf-8?B?SWtNa0FHWG5TMDkzb3U5d0tjZFdTSG1zQkM4SDQwZVlNRWVYTEhLeU0yZUFt?=
 =?utf-8?B?VThMNnZCZjdPd0JtRWFnMW9kYlU2WUZJUUNEMm5aM2JCb21Cc0lWSCt4Q1dP?=
 =?utf-8?B?YTJYWjR4Y0R2RDdiV2lvRWIxRGh6OGRscjNzYTVMcmhkV3pGWFd2K3loc2RT?=
 =?utf-8?B?Q0hTT3ZZQjNHMG41a0ZBalF4Nm8vdDNtZGRvZ09ZbllGbjM4WGNmcE9xbTNa?=
 =?utf-8?B?UUxnekExd2V3YXY5cWhOWktZdEhRS0tBeUExdEVZcEZ1R3ZvNjl1aGpheDZK?=
 =?utf-8?B?R0RNTmtWMmtlWVZaU0RwVVh0Y3QxU0p6WHdyYmhsaW9WWHNrR2pTMURMbU9Y?=
 =?utf-8?B?V2hYQ1YrMVh2S2VaKzlWM2kvV3NYOWJBYXJzdnY2NXdhd2tlUG5palpxcWlu?=
 =?utf-8?B?NkpTQ3A4d0Mwbnh5VHpWWmFKT0N0UzRhUUVoL1BMY0ZGVE4wNVVtSHJBcEho?=
 =?utf-8?B?c3VTeHZ6cVZWbWJNcDM5SktRODlscXFxdmo1K21PVXFSMnFaeDNIeGwrTG8z?=
 =?utf-8?B?WHM0RmwwUGd0bFJ2LzBwTUt2WGNvS3pNNkhqOGdqMGN2YVBDbXVWTDN4bkN3?=
 =?utf-8?B?ZEZvUTRHUCt6TVNQRm9Ic3dlL0ozTjgzMHcvVlU4dUxqQ2tSaHIydEU1OU40?=
 =?utf-8?B?dG5RZldhcE03VDZoZDZjTHhaOHdOVUt0Vno3Vmk3SnFzcDFUNitKK1dPejBZ?=
 =?utf-8?B?amtYM1doZFkyS1Iwcm1LWmt1ZzFlL0htOUVtMWhIL0ZVTFdqcGNtZHRwdXNC?=
 =?utf-8?B?WTgzdEdQVWxXZjRsYTBKNFdjRytvKy8zcXVjbGF6OW1SdmcyeFJySi9YTWRJ?=
 =?utf-8?B?MThxOUN0Zjh5WGZaNzVoRlVGNDRIUW1mNHlDa0xjRlZ1czQvbDU1d09PeXVp?=
 =?utf-8?B?ano0ZUMvS2pHZ2QzZVlULzYvbVVQRHArNGp0WEo4YnF2dytiQy9SUys0Vml4?=
 =?utf-8?B?OTFnbUpib3Rha1hTNCs2UFd1NE1QK0w0NENkWkZ4L0QyRmRxUjFPQlRlbWIx?=
 =?utf-8?B?dnZXeVpqN2d3a2FBUnBZc1Q5SkhZTCthS3NYczVHRkc5eC82SmlDSU9LdTE0?=
 =?utf-8?B?cFpmWTZkYVp2aGRDVW9GMXVaWXZ0UGVURGZsdEpONzJGbnpJWFMzdVdDSGhy?=
 =?utf-8?B?VUlyVHBnYUNIQVFWUkNmeWZNcFAwUjlHYVE3empsRzUwWngrbzd3WUgreVgy?=
 =?utf-8?B?enBnYm5TaWlVWU9XZjJmTm1iNlo3RVhQWTkzOFpYSlVpclplZFQ0eVlOQmtS?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a52f6e-cc16-423b-f0a6-08dac1a6a29a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:31:06.4391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgmvgCa2y2WNPIJSumGq2Nd33G/HgMd6S/qF3wBJIWJC7QcGwQfCMIl2dNshRlA70+todGhnXsgSK/a/QHeCKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB7016

On Tue, Nov 08, 2022 at 04:56:17PM +0100, Jan Beulich wrote:
> On 08.11.2022 14:55, Roger Pau Monne wrote:
> > The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
> > from the firmware instead of doing it on the PCI ROM on the physical
> > device.
> 
> I can't find any mention of VFCT in the ACPI 6.3 spec, nor anywhere
> under Linux'es include/acpi/. I don't mind the addition that you're
> doing, but there needs to be a pointer to a sufficiently "official"
> spec.

I've also asked for some kind of official spec, as I would assume it
should be in:

https://uefi.org/acpi

With the rest of tables not in the spec itself, but there's none.

I could add a link to the Linux header, but that's suboptimal IMO.

Are you fine with this as-is, or would you like me to elaborate about
the lack of an official spec in the commit description?

Thanks, Roger.

