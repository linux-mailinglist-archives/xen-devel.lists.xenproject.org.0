Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA4704FE2
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 15:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535208.832857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyv5K-0004Af-Ge; Tue, 16 May 2023 13:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535208.832857; Tue, 16 May 2023 13:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyv5K-00048J-Cy; Tue, 16 May 2023 13:51:26 +0000
Received: by outflank-mailman (input) for mailman id 535208;
 Tue, 16 May 2023 13:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyv5I-00048D-Dk
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 13:51:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc9d9d2e-f3f0-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 15:51:21 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 09:51:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5376.namprd03.prod.outlook.com (2603:10b6:208:1e7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 13:51:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 13:51:08 +0000
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
X-Inumbo-ID: bc9d9d2e-f3f0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684245081;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s621DDRdKuG9wyHYyqDeBihFyTv4Mgo0Qd7mVLq4MpU=;
  b=KMD5+ysUgnj4c3suJqALWQEHH+GVuW5HujiceJyfa4xrgiWbfFrL+GYb
   A1rgvlJjdGm7ALDpLd+sSVaH/LG1822KDLoMxihvEb5uFvZNUrFxnK8IF
   ftMyVZZPaBTnPiHd6xA1hAnQnA5BidQWM+WLKxZQA27vBifNusrXZI+pv
   A=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 111678433
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ti3H36P2vnBVtLbvrR2IlsFynXyQoLVcMsEvi/4bfWQNrUojgTIGx
 msaWGzQPKvcZWSgeY9+Oou/9UsFscTcx9BhGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s9bPkBUy
 KYjEyEiSAGlq9ntxe68bOY506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCLpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHqlB9JOT+bQGvhCmXi26WEJU0IqaVr4mOaSqkSTSftGN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACAcAvd/qpdhrigqVF447VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:WmwdDK1mcavSOooVClF7dAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: =?us-ascii?q?9a23=3A6aVoemgoP10guian0LPVxaMfizJuW1Hi7W3teXS?=
 =?us-ascii?q?DGElPWZu5cgSVpKRCnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AAXOOmg3XZ538Tel9CTOce0gz7jUj+oGLJ00Xyso?=
 =?us-ascii?q?6h8jHDDNbGz2wnh2uXdpy?=
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="111678433"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIMsdsxsrl0llNVIdVBu0p3dNV7VCyXvYbNnTS/pD1BX+B/ZryKZt6CmLoGeYOZaFwe8mGWi1eJbUjmgwScEp2IkRRRDHLzfKumd+MtHilMkao+mmHarBLXqMrynoQxjDwSc8sXnDxl6/Vp9EXMjNY0DsEntiS6gp+DbEF6+Hf0BEHQ7t8LYWfJdgzl0/OA3IYn9aDHHlSFVPo9mwxczbxFbEDjIXLHSQIp81sPdjXWYgDpdcZRaT88ACA6U3vmCvLHLx+OoRcT9rMBPr+1pC0HiOWByfuYNdJ52gveiLgGNcKhWo1kfvDByKTOEUGqZ2B+VHvdl4A2lE4Kp+wa6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10NddWnpMNRWtTxlaOTJyEk/AzGlbQuZ0DkZ/9+OPQU=;
 b=h3Ghvj9dTqWKufF955a/8MkacTr3hBKpnBg+pjRmc15EoTj8cYUq/ti/RFAgDw3hsQri0AbX1ljGL+Z9qJOIyqO3UgSWG+J2+/2sjLoOjWyzWfjP8lwLrC20Cu26h73R2e9WnLGyDy9Elm6ftFm5E0qQaMXqr9FOr4DOjmEby9KAKQkvsCs0Lg3Q/S+QOYafdD2iiGErB4XBZAVFriozESDzChHOOQdtbaBL407V0LMSUbC/vrAC06wfKnxIZJ8Sg25TLfAU+id0Ey0wWRrSVjNPOKw38b6xBJEbpYF5uXUdKELuSmuCk+pZ1YcqiltXNNff73k+HUxpae9DJi7e2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10NddWnpMNRWtTxlaOTJyEk/AzGlbQuZ0DkZ/9+OPQU=;
 b=MoRFgKI6XrQbRsYjRInpYWziVkrcOw4vVD+G6kNQzpqBS7cyrKUHiLlqEoz9OC4gOUzAYwjsZzDKbWfEZSvXYoYgxzrtXGu89ElIfSz96UDpz7JB6DrOBbPEaYJnKMwqHSqJEKRylX7gASfaSq0taQzF38vg17ySXYjXFgTEyLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <25421dbc-5889-a33c-37dd-d82476d56ce4@citrix.com>
Date: Tue, 16 May 2023 14:51:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
 <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
In-Reply-To: <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0592.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7b7455-0fa1-4546-63c6-08db5614998c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DHUqCIkcOD0u5rn0fisQ0yyEkfHlla4eORnU0CEbnKJIPEc8Orwz1ZhQRKwjH8Bof/TT/3ZuVUodQsBO6htMAcsvaePebIn+I/iaiB+zl8AZADanKy8guM1FzjNUZzrLzf6e7RbceiWLUh1NOeBH+kY4VTH8K6ffCjAfkStOkyWgGeBV0+29fMdEg+mfankRRk2nNHT7oD4DMblf3CO5gbEo5wiPvK3mO5eX7WJcdUmm5DnJOHhdMhnGWFsIhFbNG8PshkscB0h5HN0LdsEPSjYq0bAJX9RYMICC+iVG4DohFgAv6ex8PRoCUqt8NvDDVU8BzSDv/Bs42BnN5G1dcnj4Vk3KZjNkjbFwP3Y70DOY36MSDf9YHRDu5D6rRtGSyQSoLOds4i2FJxYsN8J8vxdrmpaylsyeH2ZazHlxSbOLkBTm5Mw+OwvZafXOMfxdmUahkqeA5Qw70rOZELUjghQzhaX5RGK8CWW1kZ0+6lasufmnmlWjjgD8HAswcmc+1TpfQORalsw4GN0G3LXc8fs3lkRDgqNNSU946dLspDlHYbFqYw2i0OoZSOZ1zt/tPD6mHnd6BlGPKxB4Z1dB8CNeKBbSUJEGFBUCQcPV2siYspPLLS644Al2ntFlRb1Bg5ENswQ8JwYiaD34uck4gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(66899021)(31686004)(8676002)(53546011)(6512007)(6506007)(5660300002)(8936002)(2616005)(26005)(86362001)(36756003)(2906002)(83380400001)(6916009)(66476007)(478600001)(41300700001)(66556008)(186003)(316002)(66946007)(54906003)(4326008)(6486002)(38100700002)(31696002)(82960400001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blNIQkVLNit4aTVPajNtSEYvYzNjTE83NUNxazR5L3N2NTZwWEpRWmQvODd6?=
 =?utf-8?B?UEdNVERmUnc5ZlorQ3Y4UnZIWTRwS3ZPbE5IVVJOTXJGcnEvd3BBQW9VVG9m?=
 =?utf-8?B?M3lpZXZ2YVFpc2VIcExyb3M1WTZVRmp6TkxjMi8vMWRjcVk3Q0VnYmFLbWJu?=
 =?utf-8?B?czFURUpNMHhUQzUwWWZLaVZPVyswYTNndmROeW54MEt4Q3luM29zYmVIU1Bt?=
 =?utf-8?B?N3kzWEVlRU0ycENmWmQxTEdkRFgxK0dTTnVlTjdPbGZlQmlpdjh4YndVTElV?=
 =?utf-8?B?ZUQ5SjcrbHpuZmtHb0wyR2UzWHBFYng5VmdPZkpjQWpnRXR6RWNzcmRUODFG?=
 =?utf-8?B?R2NDR21Xb0JwTVJtYmNaS2I3dDVJZmRRemd0T1NiaDlBZHkvRWZuMEY0dEQ0?=
 =?utf-8?B?QUtjcllWTlljdmh2UEhsR3huMEN3amZEWlJxVU1ISktNc3pyYU82eVhLbVc2?=
 =?utf-8?B?M2pkZXlCU3hkdTFuV0dzeTdYRm43M0pBN3E5WVRZQkxxc0E4MnNBdlYramdC?=
 =?utf-8?B?VWdTbGhENjBtTDlObEJzUzhJZlVlcWdnTDM1blEwZm0xWnVXQXhrb3ozZVpQ?=
 =?utf-8?B?TzFGYnNkTG1jTlNpYU5kdnhOcml4Mk5HT2NOcmh5WXBhbHY0YmplbnBJdkFr?=
 =?utf-8?B?YnMwOWR3S05OcTVkelhhZkVxM0l1eGhzY2RKamVObXZKR3NqZzViTWdUYVNp?=
 =?utf-8?B?WDBBcDNlRUdPZ2Q5NjIzQ0N0RWNpMWtRSWtCOUoxYVB0SURHN0NWT1ZXUVpU?=
 =?utf-8?B?NDgvcVJnWC81ZEo1dlJLNkdrejBKYXZ3VnQyQURGbjlXMExrT09FM3RFb2ll?=
 =?utf-8?B?d0cvMWpGOXJKaEdaQlJDYWp2MFhYdFFEN3BrU0FVU1hUb0d4NzhtYzhrRXRv?=
 =?utf-8?B?ZE5OamgzR1BDcjBNd3IyS1cxdWg4ZFBneStNN0ZXRlBudDZYVXIwNlo2L0JF?=
 =?utf-8?B?eENpL2pXMzVWME1lcnlvaDdrY2lNcnlpYkpaZlpCc2Jqanl2bDJZUER3SUM5?=
 =?utf-8?B?NE9jaGdlcWtjbGtRQjJveTJoSmVOVDhINFJKcGZOdWFXNjVDQnl6WEN4a0dZ?=
 =?utf-8?B?ZExHM1p5MkFxV2tkOGlydGVoZ0JPL0Y4T3NvS1F0UzBXMHZpT2RKQW12UU9a?=
 =?utf-8?B?Mkp6TW9wUk1aMlFaZzdXbTk0NWhRc29qY3ZvZUdEUFFhUjZsc01QSitnaTZZ?=
 =?utf-8?B?UVlncy85KzdzWU9ZUG44VjhyTWlhRUlSclp0eFNJUGpUTEVmUUtZb2c4cktY?=
 =?utf-8?B?Tk1rNmd4clJwS3BxYWRiNkQ5NkllSk9Eek1uUnVSOWcrU1AvYU4xc1JrZFpM?=
 =?utf-8?B?L1V3NlY3R1g4N1g5ZGV5QVdPeW5MS281L0s3M202MmhOaWIyWVdFY3Q3ZmlM?=
 =?utf-8?B?bzdxc2dSNDIzazBmM3lhV0RzV214NWx0Q0ExVXFRMWU5OWl4cXZYWjQvM2ov?=
 =?utf-8?B?VXJWYis0QnNpVmhvVHJjWjdzdE9VN2grMUd1VjhiQzBudURZZG5lM1pqSFVu?=
 =?utf-8?B?eHlmM3FoMnpPUm13YnB3TnpjNlpFcit4QlpCL3R6aHE2Y2QyczAvZEtVUWJn?=
 =?utf-8?B?OW5XRXNGWHhUdDlWeGhqMGlkSkIyZTNYdnkva3RhbVZxckpJdlJKUXpObDBv?=
 =?utf-8?B?NEp1TDNNVnZaTURNRE43RG9kS3loNTliVlFvTXZPZVo3Z2UyUnpvTTBUZ3Vo?=
 =?utf-8?B?K2dhbTBiQ1B5SElEUTlId2ZaQzFSYXAyakRUb0Q2ZDVTeDRNMm91WlA0S3JX?=
 =?utf-8?B?SEYyYWFrS09JbXRzTERuSU1jOG9ibmpvMlhYVUFTRzRUbkVRVEVFZnFVRFBM?=
 =?utf-8?B?dXI0VHpkSnVOY0J4eTNqM0lCSGx3aUpmMXM0UHBSZS9tdjFTVTZ6aElvSlJP?=
 =?utf-8?B?bXNENjBXeDh3QnVON0xDbW9HWnFrNVEzWXhkc3daeTZhbzM2bVdHUk42YnNi?=
 =?utf-8?B?WEYxN3JKNmdGbythaXZpYmJKNTlhbWdIRzdvTDBKOWs0dUdRQ1JiL2t0b2w0?=
 =?utf-8?B?SjBZamJNSHc0cEJYRnpyQURxQ3ZZZWhrYWF6ZTlGN1hma1p0QlV0UDhUZmpM?=
 =?utf-8?B?OXp3Qk54ZXdXbTdRSVl2VGZJN05xRmh6T2xQaDV6cnRuSGFVNlpNaTdNZDBp?=
 =?utf-8?B?d3FZUzNibUpmRXBrd3pzOTF5TnEzZnFSRE9TQWlPUmp2VzloZVhtOWRLZS9O?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JGkwTFxCLXWaCHtBasG7cYQv0AiaKUboUyXq03mW2kzYNh+NjfAye73A62lzCOhKlZn06b1lwlFYvEf9rEU+K8VQ1ijomoJX7J7VJ/4G4e42p6McLZAaZifa44Z3xhKhKwg1jKi2xmGSP3WUDD0OSmbAQlgLxERmgFt33uLRdDbDvzKyrXmx/CXANrdfIlmXqTZG5KDBn9zz0cwxpDwzDfU5WT/CpPdfm9TBy1IS77WFPyg0hUG/uQllkSKfesqZXdBHjnyLfMX/LDCagGzgKGhenv4hNQ6jblP4p3e4VTkYaQR7NY2XzlpR/J1ptCSMDbjPD/CYyrfOwO6vlrVJjYEcBdWQc/MtcACx2uvpHUoKgdid32dwpLm6D3wcigmDNkQbG+C77VCfJYrTCmhP5HK73TTV39ssc6CCk7o5Gc0wjxzaYRfoEFCsq9n6NbzBL5Va9CtqicRApg9+tpbXLIrZ5RBFCR4pbcuPn/46lBMohBb7Pj5nDA/mHvJsRet0bE9XOWHREuJjMYCN77Gg9DKJKNkq2GsPfLsEo05hPRt6r58QSyZVnf5zQ/HSRY5Qqq6TERJOIb0ZQCJbQ/lMYOzhGZiCQjWN6FzGX7HIl1OU+d46ZNp34CN6IgQSgfGW0KgDaq3OlMpFKha+uIOzJ2tD4Pt5sc+/cgRpRCvOkoxHjBNl1r/zdP4Ac0+lQ0q9Wm597+50jz0XOo2oLfm8lV8GYMGimQOC72weVBkcj7bU3NlTqWFFZX1u7JYbwpm+0WneLooJIv70dWWNsySeCbyLUBXWVmwcM2Q1ZpzQGwcHwvh0cyCbXOEMA8bPd0E1
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7b7455-0fa1-4546-63c6-08db5614998c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 13:51:08.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3pQAyLhZoq6veZqDsBbBx+mly3vevf1HBdihXLWWOFlNGnioqJ4L3WK2pqCgadeSJwXPtvQEmWlRF0qqOEmZhVsXaOLA90X2CE0D/D/dxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5376

On 16/05/2023 2:06 pm, Jan Beulich wrote:
> On 15.05.2023 16:42, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -408,6 +408,25 @@ static void __init calculate_host_policy(void)
>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>>  }
>>  
>> +static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>> +{
>> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
>> +    {
>> +        /*
>> +         * MSR_ARCH_CAPS is just feature data, and we can offer it to guests
>> +         * unconditionally, although limit it to Intel systems as it is highly
>> +         * uarch-specific.
>> +         *
>> +         * In particular, the RSBA and RRSBA bits mean "you might migrate to a
>> +         * system where RSB underflow uses alternative predictors (a.k.a
>> +         * Retpoline not safe)", so these need to be visible to a guest in all
>> +         * cases, even when it's only some other server in the pool which
>> +         * suffers the identified behaviour.
>> +         */
>> +        __set_bit(X86_FEATURE_ARCH_CAPS, fs);
>> +    }
>> +}
> The comment reads as if it wasn't applying to "max" only, but rather to
> "default". Reading this I'm therefore now (and perhaps even more so in
> the future, when coming across it) wondering whether it's misplaced, or
> and hence whether the commented code is also misplaced and/or wrong.

On migrate-in, we (well - toolstacks that understand multiple hosts)
check the cpu policy the VM saw against the appropriate PV/HVM max
policy to determine whether it can safely run.

So this is very intentionally for the max policy.  We need (I think -
still pending an clarification from Intel because there's pending work
still not published) to set RSBA unconditionally, and RRSBA conditional
on EIBRS being available, in max even on pre-Skylake hardware such that
we can migrate-in a VM which previously ran on Skylake or later hardware.

Activating this by default for VMs is just a case of swapping the CPUID
ARCH_CAPS bit from 'a' to 'A', without any adjustment to this logic.

> Further is even just non-default exposure of all the various bits okay
> to other than Dom0? IOW is there indeed no further adjustment necessary
> to guest_rdmsr()?
>
>> @@ -828,7 +845,10 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>>       * domain policy logic gains a better understanding of MSRs.
>>       */
>>      if ( is_hardware_domain(d) && cpu_has_arch_caps )
>> +    {
>>          p->feat.arch_caps = true;
>> +        p->arch_caps.raw = host_cpu_policy.arch_caps.raw;
>> +    }
> Doesn't this expose all the bits, irrespective of their exposure
> annotations in the public header?

No, because of ...

>  I.e. even more than just the two
> bits that become 'A' in patch 4, but weren't ...
>
>> @@ -858,20 +878,6 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>>          p->platform_info.cpuid_faulting = false;
>>  
>>      recalculate_cpuid_policy(d);

... this recalculate_cpuid_policy() (which was moved in patch 1), which
applies the appropriate pv/hvm max mask over the inherited bits.


More generally, this is how *all* opting-into-non-default features needs
to work when it's more than just turning on a single feature bit.  It's
also why doing full-policy levelling in the toolstack is much harder
than it appears on paper.

All domains get the default policy, so zero out all non-default
information.  It has to be recovered from somewhere.  Generally that
would be the appropriate max policy, but the host policy here is fine
because there's nothing to do other than applying the appropriate max mask.

When arch-caps becomes default, the full block feeding arch caps back
into dom0 will be dropped, but there's still a lot of work to do first.

~Andrew

