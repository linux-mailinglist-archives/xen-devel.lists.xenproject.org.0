Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3A64B4A6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460604.718546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53vh-0000Z5-Dw; Tue, 13 Dec 2022 11:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460604.718546; Tue, 13 Dec 2022 11:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53vh-0000Wu-BA; Tue, 13 Dec 2022 11:58:37 +0000
Received: by outflank-mailman (input) for mailman id 460604;
 Tue, 13 Dec 2022 11:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeL=4L=citrix.com=prvs=339e21e18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p53vf-0000Wo-W4
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:58:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76c18b9f-7add-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 12:58:33 +0100 (CET)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Dec 2022 06:58:30 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5029.namprd03.prod.outlook.com (2603:10b6:a03:1e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 11:58:29 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 11:58:28 +0000
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
X-Inumbo-ID: 76c18b9f-7add-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670932713;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=s9HRN4Twy1L3r6ABRcX3i+ZOdH2TBpTKdk5PUEbCWUQ=;
  b=WDvAVTBLTlUZQrGoQEHW9lYzjdm8ofTSyfyqsiR0jdVT/pqfch1gu50p
   FnB8Y8GUdOb+QNNO0cVcWQGreenfU4CqY3sMytPyVGE+yWmV3wi6/wy9R
   5PzZMl8dwnQfILJ0Wdd8fAYfoe6zD2VxxBTRP0zkvSAwrrOok+HBmyhVh
   Y=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 88495162
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Fz3e+6yGZKEG0jqQdP96t+fixyrEfRIJ4+MujC+fZmUNrF6WrkUGz
 2EdWGuGOKuPZGb8LY90aIuzoR4FucTQnYIySQtq+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPKsT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXBs9
 uY6BWAqUgC4jNqR4pOkS/hC3Nt2eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQsuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1r+TzH6iBth6+LuQsc9wx2O8zzIvKxgJXlDqr+KAumWhRIcKQ
 6AT0m90xUQoz2SoQ8f8WVukoXeClh8aR9dUVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXVHTb8L6XpDGzPCE9LGkeaCtCRgwAi/HBiowuihPETv54DbW4yNbyHFnY3
 DSivCU4wbIJgqY2O76T+FnGh3epucLPRwtsvgHPBDv9s0V+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRfHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:sJrotqlI6V7i5Yv8nIFs8jyIi5HpDfIQ3DAbv31ZSRFFG/Fw9v
 rPoB1/73TJYVkqNk3I9erwWpVoBEmskqKdn7NhWYtKLTOGhILAFugLgbcKgQeQfREW2dQz6U
 4KSdkcNDSfNykesS5zjTPIaurJiLG8mpxBz4/loktQcQ==
X-IronPort-AV: E=Sophos;i="5.96,241,1665460800"; 
   d="scan'208";a="88495162"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDKLpt1JPKAL/Nue1Xp8TMoO2By7SFeYtyymO0DIZAeB+hnq3TV0QzpYaeZA1Govpv3JAsv4Ru5qGVLBB2wiYfaaVPQXzb53ZiP0YUuPvnUVhjR3h8LlrES1VfTi2GGAYJMgdlcKd+x7ZB92qasMjELuyEk8y94UBRSL4Shci3s9kQFgELAGddtp8Y2w8a/Ht/9cjwD8yUCwrX+eoZIFyC0tN/idEbjLcwNznffpld9UGfaCB8EHImGhlibqguRO7KV8+Jfy6cLxCpCWffY/5LenkGunB9XC09v7/QF6OZU7/lQyMn8xr4EjYc5b2lFegiej3fueBQwf4CK8rh5p9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWNXsaRD/d+EwuAZAFxSCkW2dju97M7XgpALDcoIa9c=;
 b=Sw8nvx8ikF4KdVkI4uWNYsU1vZGZ3bwt0ENiOoMQSwqpCmyiH12AZ0FKaoyFpY/yOa/PFMFoCi5v6fV8YZfWulYxQfCNPVM2r5PyebUtAQmKigl9PIX275yWMxbKumSA7JzERNJphO3JcQAAh01E8PwD/mAYNz/FghsT3SfCXjsyhWw0T4nt3JUNNVlUE/STrhFDhMXqzx7hhBA7vpbE24bHrS+dcy+O0eeuZvx5K5dykYmUJSGydXhW6gNsAMnFsP8B58/liCcAh9CuV2Z9UPZFeb/bpignZdGSqQf09tZ2A7y8pRKoMkv/VJu1A20/YVqeA9qc4h3Tj1JYVmXMew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWNXsaRD/d+EwuAZAFxSCkW2dju97M7XgpALDcoIa9c=;
 b=blKmNWzTN1r13aJqGbvZDfF5qGArYZt3bq2aQwhw6Lg6p6UwFR8p3TgvO6nDmhsWpgCdOk84r28Rv1O7jIBELfzOH46DSxy3KngzW93FYQNDlBuFDevPj+AqMSVeDZB2oa6Rbyd8v89SALTXDsdm0uOPiD/TrMb661YLTL4lrws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Dec 2022 12:58:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"Beulich, Jan" <JBeulich@suse.com>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Message-ID: <Y5ho3U6Kd3RlLs3W@MacBook-Air-de-Roger.local>
References: <20220701131648.34292-1-roger.pau@citrix.com>
 <20220701131648.34292-2-roger.pau@citrix.com>
 <BN9PR11MB5276F1BD6EF95A7E35534B648C8F9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276F1BD6EF95A7E35534B648C8F9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: LO0P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: c55dbe71-6344-4070-fe97-08dadd015833
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i/NJipE5pHoyyXhoZrMAPqsdzcigQKawbp0nLTSYsJ/ste8eOrZfRt5zJp5H6IZSio+ptNTCZlMNckdHPUg1YvVujmklCJbInySNjyurUVxpCymqGwMFkrE3cFN7ewCCeCuumXP3IHzq7FfKmipsRxrh4PCqGEiHkjERqES7lB5cTg4exA86xnImEQmf25OYAgDD0GOVrP3cwuw0YnwZPfe8Epmln5wQrHJC3bJ/TfiDxZUWOmbMEbHc3WmWF+H/KX7PAjsd4lTn6KoD8cMGd6EdzzE/flOL6m1dewRUMCih1jp502bdVXjmLh6mHaxGwE5iFirO5it4YanRLJuZtlFeLPLaFlJH0GtcVDh/fpcLvw1T+UjI6bLodChqg7bm2TbJPujWDXyqfE1z7Lc3/QdRD+t6/ZmjmcRjeuw7zHd0gmYvsr+H1CNOyizcIyvtG6EveQdexwR0eN6RX9ylLUZgyObpPq36RjUmaEnO+tnX7HO1IEAhykvLI58oPF5HVzZv9+yQ2t80jWPAUvJVrJzu2fwMjc459qlMx/7CpzqZWokMwBkH37FoM096wqC1Eb/A6JiNhcVIiAtojkKqvseq6biHVt8BWtx1odXgbSH66G7CPF3wDYaDopcIIZW3QBLOicUO8Hj06/cfheU1wQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199015)(478600001)(41300700001)(5660300002)(8676002)(4326008)(6666004)(6486002)(54906003)(6916009)(85182001)(316002)(2906002)(66476007)(8936002)(66556008)(66946007)(86362001)(6512007)(38100700002)(9686003)(6506007)(82960400001)(26005)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRXbTRaOGpHMEh6cDlQUmxtTFVyWmo0cDFHWUVnV205SGlkVkFuNmh3Qk1u?=
 =?utf-8?B?Z3FxQ2s1ZGhiS1d0OUtZV0h5Z0Erc0hrOG1OSDFrb216LzBTd2QwMEs3cHZW?=
 =?utf-8?B?WFdIdXk1bEZwcVkvT2c2d2RJMVJsYmNYQkg4SmVGenIzc2FzVWZoTFhGaG5i?=
 =?utf-8?B?VXUySTdMbmpPSUd1TW4xaE1SWVhjdjVra1Y1a3h0aFpxekUxbmlBMU9Ganc2?=
 =?utf-8?B?WVJnelU2Nk1XdUdrZThaN3U1RG41Z24wYXpaVDdxcFZ1Z2tTb1JCbCtMN0pU?=
 =?utf-8?B?d004cmNoQXJRYXpYbWR6Q3FKcnltS3Myd2xGREx5cWt0MjlDZ3IxQzVOblRX?=
 =?utf-8?B?Q3VkeDVOQjRwZWxlTkwzYlpNQXBOY0dGZEg1aXBTVmdzTERqZXphY3VaUm1w?=
 =?utf-8?B?cWpnWU9zRndsZ3Z4NGJtZmZVODcrSmdDRUxPTU50RDFSOWRROEw5bFpaaTE2?=
 =?utf-8?B?dkMvbmpTZWJkNE16bU1RZkcvVnNmQXhDaVVWVWx5a25TYnQyMzZ4MkZSamtT?=
 =?utf-8?B?QXhNZy9wa3BpZHk0SlJpbkVCSGpqOUhNM2ZDbzhzK01ycFo0Vm41RFIzcmlr?=
 =?utf-8?B?ZDJzM3U3eVp4bC9pRS9oQ3IxU2VIdlA1L0tCdFdDS0hUdmtFZnI5Y1BVT3BS?=
 =?utf-8?B?dFZmbjBDY0V3K2pIOHZTakFxems2TU5UZWdhaDJTcGQ5WmFPck5hZXVpeVVl?=
 =?utf-8?B?TDhRWnJjUG9uNGltaGF0cVlTcU1HUmhTaWU2NXpKWGNvMlkvbWZaenpQVitw?=
 =?utf-8?B?TnRKNWdmMjVuUnF2bzUrdDU0WGdPMUpDQ3ZHczJLNmJDRnZFTmt3OE43enBN?=
 =?utf-8?B?UlltRnhUa2ladjZySGdRVGNmT1FVT0pZTzgzMjBhN0FjVnYvN2hlUVZrRDgv?=
 =?utf-8?B?aWc5SmY4djdjenZSbVZkdFh4TXhUN29pNjdWSHZhQXVlZFlvZE9MMEs1djZM?=
 =?utf-8?B?MjZERlBGNEVxdTYrWFNGQnBvVUgxc1VmNFQ4OW0xNGlVTTJ6RE9QK0loVzZU?=
 =?utf-8?B?blJrdXQzSWdvV2N5L3I2L0gyWEp6UFUwRW4weXBJUFM2L1JaSXRuOXFFRGht?=
 =?utf-8?B?eitaNTY4enVIQXVST0N3NFRqd0NQOTQ5MVFtVzAzdzAyWm5NNFlNL0hmM283?=
 =?utf-8?B?Q2FaWFFKclhiNVAybysrVkhaYURsbWx5SWtrRUVua1YyZ3U5SDZ0YmhnNHdj?=
 =?utf-8?B?MGk0bWRDUm9ZSW8rUDN3dlhOZm43TlUzL0FCeVkwZjkxQlRzS2lGc3RNUTRI?=
 =?utf-8?B?eW1EWEd6T1hKalhmWVJ4VzVsV3RiSERCa0JTdUFnWEREaGFMeGpZektkakFL?=
 =?utf-8?B?cDFCUVA1R0xGTzRURnBXNXF2VDR1a3k5UWVxa0k5TGJFTWpxK2pTeWt3ODdB?=
 =?utf-8?B?NWFXcDFOU1huSmVKTkNoRnFoMTdINFU4WkZLWlg1bG1vOE9PUkN1UkU5OGxt?=
 =?utf-8?B?UWtvOXNJL2tRZUt5TExKL2Y3UEZOREozM2lkbE5wTWtHTlplMXBqMzJpaXpU?=
 =?utf-8?B?bXZGSDIwY2VWRGFPT1JubnFWMzdaeDBTQ2pPWWlMQUpUOStCS1MwdWtvZEMx?=
 =?utf-8?B?T29kUUJ1M1BlWnp1T2doM0JnYVYrd0lhRmhrdXZDT0hhdHJ6QmxraEtLMnhw?=
 =?utf-8?B?bWFPZXZIQVhlZzlDY2VaNEdmTngxRnhTZ0JlcmpjQy9NMDZwYmNpVy9RVXcx?=
 =?utf-8?B?WndFeWEvM3ljVnBOaFlsSkZSQlVBSSt2NXNtb1Eva0IwdjczVUFXdnEwdUtu?=
 =?utf-8?B?bUJpa1hESFV4MFZXSHpTdkFMb1pTVFpKdFYxQy9Fc3RSbzNaV3YrT0tORlB6?=
 =?utf-8?B?Y3gyWjVEYkh4U1p6WXd3OWRpNW9ySU9scFNqWW1kdTd2SGlzQmMvY29Nd2hy?=
 =?utf-8?B?SkRFS2tYbEVDeGxGVDBEQ0tESFNUdHNJdlptU1hyTzJXWXF1cmY0aTYvR3Z3?=
 =?utf-8?B?bGhNdmhMYnZ2VjFzM0VHT3pTYnYzTy9KckwvdlJNbFlUckNDMFNqV09QNDRC?=
 =?utf-8?B?cytxN0MrdURhTTQzMS91WXo2YnNsS2JtOUN2ZE94VnA1eVBON3NGblozVThO?=
 =?utf-8?B?clZjNUZ2MVp2d0svZDNtOTlmd1FlMytrdVEwai9QUTRuQ2krbFVTNm9oU0l2?=
 =?utf-8?Q?o9tsOPOZ+MxGwJXDtTcwJzy+E?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55dbe71-6344-4070-fe97-08dadd015833
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:58:28.7550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWU88saiVJY/MKllfzpJduoFYqGWQT+xZvRjm7Gn7MyRpSNcV+RqqMFp6EIbwPFPP0iYnJ/fNqagypsuwbKv0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5029

On Tue, Jul 19, 2022 at 07:26:08AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Friday, July 1, 2022 9:17 PM
> > 
> > @@ -4065,6 +4065,11 @@ void vmx_vmexit_handler(struct cpu_user_regs
> > *regs)
> > 
> >      if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
> >          return vmx_failed_vmentry(exit_reason, regs);
> 
> Add a blank line.
> 
> > +    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
> > +    {
> > +        perfc_incr(buslock);
> > +        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
> > +    }
> > 
> >      if ( v->arch.hvm.vmx.vmx_realmode )
> >      {
> > @@ -4561,6 +4566,15 @@ void vmx_vmexit_handler(struct cpu_user_regs
> > *regs)
> >          vmx_handle_descriptor_access(exit_reason);
> >          break;
> > 
> > +    case EXIT_REASON_BUS_LOCK:
> > +        /*
> > +         * Nothing to do: just taking a vmexit should be enough of a pause to
> > +         * prevent a VM from crippling the host with bus locks.  Note
> > +         * EXIT_REASON_BUS_LOCK will always have bit 26 set in exit_reason,
> > and
> > +         * hence the perf counter is already increased.
> > +         */
> > +        break;
> > +
> 
> Would it be helpful from diagnostic angle by throwing out a warning,
> once per the culprit domain?

Hm, not sure.  I've assumed that increasing the counter would be
enough, but that's not tied to a domain.

I will leave as-is unless someone else expresses interest in this (and
can also be added later if desired).

Thanks, Roger.

