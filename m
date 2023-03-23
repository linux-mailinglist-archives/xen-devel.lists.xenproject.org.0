Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7966C6DE8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 17:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513976.795811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNzO-0008PI-1T; Thu, 23 Mar 2023 16:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513976.795811; Thu, 23 Mar 2023 16:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNzN-0008OH-Uj; Thu, 23 Mar 2023 16:40:33 +0000
Received: by outflank-mailman (input) for mailman id 513976;
 Thu, 23 Mar 2023 16:40:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIVP=7P=citrix.com=prvs=439b2ffc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pfNzM-0008AX-1C
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 16:40:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b803260-c999-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 17:40:30 +0100 (CET)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 12:40:27 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB5895.namprd03.prod.outlook.com (2603:10b6:510:35::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 16:40:25 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 16:40:24 +0000
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
X-Inumbo-ID: 6b803260-c999-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679589630;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AtQtyD14dA4ahSBD0R6Y2FbIs8mgWElM4ZloszC971M=;
  b=dUm/HchjrHY5sC3wPldfb/pKfaO+QKYNOBHdRfA3QM+MW/TLAAE+Pb1h
   AH5NEdF3DvOEiQV0+ez0nymvm8erc8QwED4Z9mGZFjj4VUMDn+Kj7pL8z
   QhVKxW03ZkZk2AH2o/ayoYBFHFah6UCQGJnxT0HLNNRhAIaL0+c2woUUV
   o=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 104477047
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:I7kVPKIFAlSxwOGcFE+R5ZQlxSXFcZb7ZxGr2PjKsXjdYENS0DRVn
 GcfCG+HaKmOYTTye9wiPdm280lX6MCGnYNhSAdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4nL1toq
 MQ4dwoEQTGIm6WK/r2JbO5z05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMkWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02rOQwnunB+r+EpXoxvJMh02rxVA4IzQrdkPnk/m1klGXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSRmrbm9WX+bsLCOoluaJiw9PWIEIygeQmM4D8LLpYgyilfFSIZlGavs1NntQ2ivn
 naNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFDFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:a3rzNa6UCl8dRh2HfQPXwBrXdLJyesId70hD6qkmc20oTiW9rb
 HUoB19726NtN9xYgBYpTnkAsO9qBznhP1ICOUqXYtKGTOW3VdAT7sSi7cKoQeQeREWrdQtr5
 uIGpIWYLbN5BpB/KLHCWKDYrEdKbe8kZyAtKP302pqVg1ybrEI1XYFNu9ZKCFLrct9aKbR2K
 Dy2iOPnVSdRUg=
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="104477047"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKFXVCLboqQi7akSbC8Zixp/92VG4zc5hWyNZ9AUN3UeKyeLwKmDeQWQDBkUCirBbf9jY5vfWNAMnevuAdubl/hquXgXAFYMbDu4CIVM9nx93Lfu7agpEZXFkiGXXJ4ybJKBK0ZL8N+TC9Vfd2bobpnJzu4m8FHsj/89Zz5HIF5+LfNO47Vyf5W0Roa3IrLzBR8TqpzHm8tgJZPAbMdok1fTB406YA1e6EYCKToY3clax40y5+bSOcSgJOPnF1+WvvyLMI5VvXfpCFJZmZv+Pk3c5drrdm7LpAMog5ca3jVMHcliXoI3Fi10V8T/6Gd7jskQLmts1qufQwRUxbRoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQIme0z1UX8avl0PBOivG91gfEJx0sh37IhCdM14A7U=;
 b=T3h4TAiCFgj1gajXyhSHRq8mEMYbCrM0Zv5N7Agbogv9eoO00zNgNgERMOgIdJJG/dYKSgqtAhjlWoYRo9IG8hfoZ5XIiTq5ISObnDJr9Wkc+hcqCW44Gqo+wr0CV9TUkmYAXCb6hYH5jxtqxrHbdMSooUsXL9WFyD/OSpZdn0PjgNm4DUR2m7pt30zmQomzkKKiMEbbdRO6/8zlMBw78saMwIDa62pTqimj0mZcpWryCqDc1OMRUD9VNVK3E/jJz2NhS04WSOgDOgL+jpQeE2rYSUpgUNx6gFkni/7VdoOYSkch6/Zm+hiVt94JpaRU/t0RZYAneqdJcsV4eoPLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQIme0z1UX8avl0PBOivG91gfEJx0sh37IhCdM14A7U=;
 b=ohPZ+R3apnxRQhteO9wW9spjE2uq9Sm0sOYZWrsNXaJ0zkUlbxgGhlxFFahRrp+OvS+8i+8qLeKO7vQHHUT/3tjG2V2KUvTY2xSBFHJikq10LcP32NHTlyc+na+kFaiisR2Fue/S8d5F+HGESeRDC6Ubsi4Wk5mj/SITQO9UlOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Mar 2023 17:40:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZByA88LU2YgEbcK9@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
 <ZBxm+7/ldyHclXwc@Air-de-Roger>
 <62e5d8fe-df2e-eb95-bc8f-631dad4204f2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62e5d8fe-df2e-eb95-bc8f-631dad4204f2@suse.com>
X-ClientProxiedBy: LO2P265CA0484.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: 84fd7361-3594-414e-235e-08db2bbd4d12
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Tq9s1w9JAMiCwJr5O9nezygM8/HpOQTb2vO/PoXqm/EZ6ZmZikXv1gc6eKGvXnptnynUQiu04EOoo8NrODl0LlvWtMabv1UjjS8xVqqTYdmtd2p+3dPlI55dvtZaxCXN74WIDZzaXisJMXOo/OA+5sqZ/rvoqUvOQIacT5XtNDZE/8wDDbtzwflBvzzFfzyAFD15JFrjoZWba5UdctNLOZz+/D/ssOToihNxVZht6OkGThs4vNO/BxQCh5cNIGs9gA9XUtyKGHvQJk1YgSt4EJ8zSUgHV8x746MWUL9GLzlffYPuQzT04yQ20WUZlOcMwOK8Qf6E6sJxap1sVsAvPKuAVdXXDnce1pBrQvk9LvKZ0BRgG6zz8XRsSKDdEiVLfyUbW76dMWniWk78UaQJI3v+72DeaDDQDC/xh7mttuibrBKYCuBSA1nL9vTpgB33KwQ6wmpN1xq9pl9rJD3dDn+1YpwR7Q9nbDBjkUw6wAeWjfpLd4xRMIuuvgvGrGz56GtOaMAK2Ip7biS5ZbM+DTLtEIdpo3U2jxzABOyyIZahtKpECMLXT2MxXT8sC7etV3sFqYYKw7BsPDhz+yG1UXLJwPxyG9JjDUovlKfrwYCL7DHTC/OGhdDmogaXnr3FwZCvaF0uEbBeEVfEj1u7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199018)(478600001)(8676002)(5660300002)(6916009)(66556008)(4326008)(66476007)(316002)(66946007)(41300700001)(82960400001)(6506007)(53546011)(6666004)(8936002)(6512007)(26005)(186003)(9686003)(83380400001)(6486002)(85182001)(54906003)(33716001)(86362001)(38100700002)(2906002)(66899018);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WCtDYktXUFlqbFl5cGlsUDcyY3UyMmswZUtTL3FFaDdEdmMrazl2dzBvTlBz?=
 =?utf-8?B?bHFrT21IOUFxZWdhenNjaS95ODVlbXlGNHNBL2JLY2M1dFdkWU9MRlNUSmhH?=
 =?utf-8?B?UHdmU09NSnMvWTJ6MWUzR2JWWjNTcTJVM0pGejRJYlVCNElYM1oxSjV2NlFP?=
 =?utf-8?B?U0lRbVozVHNCWjhjdG9FVGNHUFhWM3U0OVhnVVlNRkpqaW1KMWZPUFpPL0VJ?=
 =?utf-8?B?d2ZKaDZKd0xqc3AyRjI5RS8xVTJMNlAwUnJsWHdBeUN2eWNFRWdGVVF1Rjdi?=
 =?utf-8?B?WVQ5QWhUQzBYQm1NeGZwKzN2OU1YZnZLaXFvcFpRdVMxL2NuU3hzRFRuS3pz?=
 =?utf-8?B?TUliS2VmbVVLK3FiemJCUVVtSGlxK1doZlM4UE54QjQ2cDdDeEFqcXpXeEJo?=
 =?utf-8?B?MFo0NWNFNzdDMm5Jb0xiOVNlbzBrNkdERVczV3FXL0N0M0NaRmpiSTI2OHdw?=
 =?utf-8?B?R2YwaTYvV2ZDdDF2dHlkQ1ZPQVlWaTY3Unk4REdBVmV2QnJ4emxuc0krRzNV?=
 =?utf-8?B?UlU5NE9ZWDVOVHZNNXJ3WTVqZ04rTGVtSDNhbzBTaEpNUXZOSFB4ZzVvU2FS?=
 =?utf-8?B?dHV3cjIrbkp2N1lnVHFsdHk5amJVdjZ1RGZuNktOSlJCZmNsQmVuNE42Y3c5?=
 =?utf-8?B?VW5HSTBLa1ZBZWpNQ21NSFY5ZVJaMEtmZm5jYWNHMGNLV0Jya2VqZ25SeGRT?=
 =?utf-8?B?ZkVqSnVGdmFPbjZ1VEN0K0p6QTYwdmpFeVMzd1E3eVAxVU5sbnhKcVVSZy9W?=
 =?utf-8?B?MlRYME54b3BrOWZ2K2dVT3ZPdGdYbC9HdThLRkRmR2hWY1duTkw4ME1OKzl4?=
 =?utf-8?B?YllKNEJDaFRjRG1ERkFYNGtHOWc3SDAzTE94VjR3K0FWNlJLQlIyVjNNSCtm?=
 =?utf-8?B?VGh5eUx6bmUyS0VLbXlFM3lUOUU0aGwyZTZLM3dYRlRocnp3a1RpTXRDYlZJ?=
 =?utf-8?B?UkExTjUrQWxWcGJLZHJOenRYYmV5TmtxUVhobnh6T2JpVzFOQS9jbzBoamFW?=
 =?utf-8?B?dmpBQk5WWlg1a3I3YnFGejN5NWR4MnFvcU1TRi9uVUZaa0phRVpyNFZHNklq?=
 =?utf-8?B?MUM3cUQ5RE82OGtab1BxWmY1aXN1eVI2TUpoVGtaRFN6d3lZVFY3SWttRGpF?=
 =?utf-8?B?eDBNSTBTOGlZVG54dnBXV25tSVRIcjdEQWk3bWtUUmJLYUU4c0VIdnFRZUFZ?=
 =?utf-8?B?L1lsR0NsVVNqVjdwc1FmZnk1eVRmNi9rQWQzYzhYcGpGZHRhK0V6RGM4RHVo?=
 =?utf-8?B?d0xFcWIvYWNOU2VEQkNtbFpFa2U5Mm01VlZsUnBrUmhERi92M29HTGl1cGlr?=
 =?utf-8?B?elNUVFpiczlnZzBFbjJ3OE14U3NVVGFweFk0YnRVc0VjalNyVjNjUDZWelZC?=
 =?utf-8?B?K3VONGRVdmVqT3FDSzQ3UUZoVFdMTHBBWm1wUFcva0RUMi9SSUE5T3g2dzhK?=
 =?utf-8?B?eXllSlk1MmJFdk95VGNLT05uVGtVc3ZlNmhNMUFCVUc1U2I4RXJ6WDAxb2E2?=
 =?utf-8?B?QlZoMVIrR3RKZ2tpUlhLQTI3Wk1BczhkUVJiSVh2VWM2TTJueGVkYnA5V2Vn?=
 =?utf-8?B?ckxUVGZHajVrMnNpdGMzRHJSNVFvY3N5MkU4enY4eUZMQ0FFYkc5bzhjcGlz?=
 =?utf-8?B?ZVJ4NXBOQXNjKzdGMiszcEFKSDVFeE1ZdklmeUYrNFNHOFhNb3FlVjFYT3o3?=
 =?utf-8?B?K2UxWVU1cjYxSnE4dTdzYkhjbjcyYjl1YlFzTEFDRllNQ2N4U21xU0czdTF4?=
 =?utf-8?B?WXdHY0pZd3YwN25heFBmM05DejlJY1FaRHJUenMyUnNscGFuRUJJVldiY2I4?=
 =?utf-8?B?ZWdlYVlHNHdmTUJJSStacDc4T3A3RW9oT0gwTi81b0JwKzlSdUlTM1hOWU11?=
 =?utf-8?B?S05odTlVenlJdXhPQmlobloyZDNQWTUyTVhRbTJQQzQwQW40UUdXMFlBeGRz?=
 =?utf-8?B?VWU4R3BwVkdhQVFhZzJuL0dyL3FIM1lhMUVZZXkwRVVLNHFLQko0N1FWS2N1?=
 =?utf-8?B?QkwxeGVUREorb2ZjbnJQVFcwdm9Wa1RUbm9oVm1YcWtEQnVQd2ZMSDJMd0dj?=
 =?utf-8?B?c2MvUlRDd0ZkTnpSZmhUQUN5MHJwYWsvMTY5czBUZ0pVNVhhVm1lazVPUTRT?=
 =?utf-8?B?ZmhOV3RFNU9VRmMxVCt0Qi9JQ0tVSHZ6c1dWRG9Sdjg2U3JZM2VyWExlbm5w?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PohccKFwVSS5EfmMEqYOtXhSqrQwkxdYVrALSxdO10VFQuKBLvSGpf3HhBrKODjLwxsK0wPPvTPTskCQHNfAHVzPx8NraIS5IINMRlGmGAy6gHQjX6H9wSsiN58tDkTx872cadfsq7bsV/TwiQrqP4JiPDRsY3IyGjPpBr9i6b1lfJ6Jzt/ZTVxZmqj86fHBOWSxXEh3/R4AG3s42cPaw7tXeon219OX0648HhBMBYmQ3OVQUsTv7fvv6/zZ9JIw4cw+l1WbldVN54vid012nUuu26NsX8WKOh11DM/9lurazhrALRDBc/p4YW+9QIhDg5dyPTydnnKSTe8c5oJlPlD7tf6aOrcrRIKRIomJCN1M4GIXw8kZN/zsm7zx4SjbMqP6QZI+1lbqefD7HHGYlYayN2wgSsm5OvqoNjEHgg70ooQqWttnztoWUCQBSPmLwzjiKucg0Edmy6VpAvsKEP6/TFxcSDTHoyvqQWsqxl46QkoHeaVkDOiztkO2p/llVixZNDdMNAOnuNYKnLxm84AGl69tStiKDcBQVQpDy/1JzWBTY2FjF1Wejwo26Q7kQ/ZTuscV7Yvrfzp1LkrnXjl6JAw8KnIFfsEK6LkS4xFZsS12qCKF/WhRe5cbMAjikgattaq0C7sjV6M4FyapkVvy5Va4CxBBIjC9v7RgII5NK5yigq54NMOJzJZGuGILbiNKHt94nmGPk8cwiulMb8aokrFf10a5Yy/+f1dNrea5Up+FneJ/WUNVcViScx5fTVdrC/Knt06PunjVeljEHeI4/RQBOiDnNsg07RzVSKXlNDioSARK1lJ5s92VV+rj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fd7361-3594-414e-235e-08db2bbd4d12
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 16:40:24.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mKE2T9oQ6BLTy38+LCJi2dW3v2A+Osgg7YcjymjZ1qzHEpyWMvZYfT+dN9t0q4GvD2BcVK4YNE/aastxVRSDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5895

On Thu, Mar 23, 2023 at 05:08:43PM +0100, Jan Beulich wrote:
> On 23.03.2023 15:49, Roger Pau Monné wrote:
> > On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/include/asm/mc146818rtc.h
> >> +++ b/xen/arch/x86/include/asm/mc146818rtc.h
> >> @@ -9,6 +9,10 @@
> >>  
> >>  extern spinlock_t rtc_lock;             /* serialize CMOS RAM access */
> >>  
> >> +struct domain;
> >> +bool is_cmos_port(unsigned int port, unsigned int bytes,
> >> +                  const struct domain *d);
> > 
> > We seem to usually name this rtc rather than cmos, any reason to use
> > cmos for the helper naming rather than rtc?
> > 
> > If not I would rather use is_rtc_port(), so that we can keep it in
> > sync with the existing RTC_PORT() macros and the handler names
> > rtc_guest_{read,write}, hw_rtc_io.
> 
> Already when talking about just ports 70 and 71 there's more CMOS
> behind them than RTC. With extended CMOS accesses the ratio further
> shifts. So I view using "rtc" here simply as increasingly
> inappropriate.

Hm, it's your patch at the end, and such decision would likely fall
under the same bag as other style related questions.

I would prefer to keep the naming consistent, as to not confuse
readers with code dealing with the same underlying IO ports using both
RTC and CMOS, but that's just my taste.

> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -2072,37 +2072,36 @@ int __hwdom_init xen_in_range(unsigned l
> >>  static int __hwdom_init cf_check io_bitmap_cb(
> >>      unsigned long s, unsigned long e, void *ctx)
> >>  {
> >> -    struct domain *d = ctx;
> >> +    const struct domain *d = ctx;
> >>      unsigned int i;
> >>  
> >>      ASSERT(e <= INT_MAX);
> >>      for ( i = s; i <= e; i++ )
> >> -        __clear_bit(i, d->arch.hvm.io_bitmap);
> >> +        /*
> >> +         * Accesses to RTC ports also need to be trapped in order to keep
> >> +         * consistency with PV.
> >> +         */
> > 
> > More than to keep consistency with PV, don't we need to trap accesses
> > to that concurrent accesses between dom0 and Xen (when also using the
> > device) don't overlap, as the RTC/CMOS space uses indirect indexing.
> 
> That's what I read "consistency" to mean.

But consistency with PV?  We need to keep consistency with concurrent
Xen (hypervisor) accesses I would think.

I would s/PV/hypervisor accesses/ in the comment above while moving
it.

> >> +        for ( i = RTC_REG_D + 1; i < 0x80; ++i )
> >> +        {
> >> +            uint8_t normal, alt;
> >> +            unsigned long flags;
> >> +
> >> +            if ( i == acpi_gbl_FADT.century )
> >> +                continue;
> >> +
> >> +            spin_lock_irqsave(&rtc_lock, flags);
> >> +
> >> +            normal = CMOS_READ(i);
> >> +            if ( inb(RTC_PORT(offs)) != i )
> >> +                read = false;
> >> +
> >> +            alt = inb(RTC_PORT(offs + 1));
> >> +
> >> +            spin_unlock_irqrestore(&rtc_lock, flags);
> >> +
> >> +            if ( normal != alt )
> >> +                break;
> >> +
> >> +            process_pending_softirqs();
> > 
> > You adding a call to process pending softirqs for every loop
> > iteration makes me wonder how long is each of those accesses expected
> > to take, since we could be performing a lot of them (0x80 * 3).
> 
> It seemed best to me to keep things simple here, at the expense at a
> few too many calls.
> 
> > I don't think so, but there can not be any side effects from reading
> > from the CMOS RAM I would assume, even for cases where the CMOS ports
> > are not aliases?
> 
> Well, one of the fundamental assumptions is that these read attempts
> won't have side effects. Without that assumption we simply can't do
> such probing.
> 
> > I would assume ports to be either aliased to the CMOS, or otherwise
> > reserved.  What makes me wonder if it wouldn't be simpler to just
> > passthough accesses to all the possible CMOS alias ports.
> 
> But we need to intercept writes to 70 to track the index. IOW we
> cannot simply pass through all of them, and we also cannot simply
> intercept them all and treat them all the same.

Why couldn't we intercept all the possible alias port and passthrough
all of them?  As long as there's nothing else there's no risk in doing
so?

> >> +bool is_cmos_port(unsigned int port, unsigned int bytes, const struct domain *d)
> >> +{
> >> +    if ( !is_hardware_domain(d) )
> >> +        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
> >> +
> >> +    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
> >> +         port <= RTC_PORT(cmos_alias_mask | 1) && port + bytes > RTC_PORT(0) )
> >> +    {
> >> +        unsigned int cmos = RTC_PORT(0), nr = 2, step;
> >> +
> >> +        while ( cmos_alias_mask & nr )
> >> +            nr <<= 1;
> >> +        for ( step = nr << 1;
> >> +              step < cmos_alias_mask && !(cmos_alias_mask & step); )
> >> +            step <<= 1;
> >> +        do {
> >> +            if ( !(cmos & ~RTC_PORT(cmos_alias_mask)) &&
> >> +                 port <= cmos + 1 && port + bytes > cmos )
> >> +                return true;
> >> +            cmos += step;
> >> +        } while ( cmos <= RTC_PORT(cmos_alias_mask) );
> > 
> > I would use a for loop similar to the one used in probe_cmos_alias()
> > to check for aliased accesses?
> > 
> > if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
> >     return true;
> > 
> > for ( offs = 2; offs < 8; offs <<= 1 )
> > {
> >     if ( !(offs & cmos_alias_mask) )
> >         continue;
> >     if ( port <= RTC_PORT(1 + off) && port + bytes > RTC_PORT(off) )
> >         return true;
> > }
> > 
> > return false;
> > 
> > So that you can also optimize for the more common case RTC_PORT(0) and
> > RTC_PORT(1) are used?
> > 
> > Or there's something I'm missing?
> 
> I'll have to check carefully, but to be honest I would prefer to not
> touch this code again unless there's clearly something wrong with it.

TBH, I think the proposed code is extremely difficult to follow, there
are 3 loops in a row which gives me a headache when thinking about all
the possible combinations.

I think my proposed alternative is much easier to follow because it
has a single loop, and it's using the same bounds used to fill the
cmos_alias_mask in the first place.  But maybe that's just my taste.

> >> @@ -1256,7 +1333,7 @@ unsigned int rtc_guest_read(unsigned int
> >>      unsigned long flags;
> >>      unsigned int data = ~0;
> >>  
> >> -    switch ( port )
> >> +    switch ( port & ~cmos_alias_mask )
> >>      {
> >>      case RTC_PORT(0):
> >>          /*
> >> @@ -1264,15 +1341,16 @@ unsigned int rtc_guest_read(unsigned int
> >>           * of the first RTC port, as there's no access to the physical IO
> >>           * ports.
> >>           */
> >> -        data = currd->arch.cmos_idx;
> >> +        data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));
> > 
> > We do allow read access to alias ports even when the underling
> > hardware does do so,
> 
> I'm afraid I don't understand this, so ...
> 
> > which I think is fine, but might be worth a
> > comment (since we already detect whether the RTC_PORT(0) alias is also
> > readable.
> 
> ... I can't really derive what kind of information you're after to put
> in a comment.

Reading from ports that alias RTC_PORT(0) might not always return the
value written to RTC_PORT(0) (you have a check for that in
probe_cmos_alias()).  Yet in rtc_guest_read() Xen does always return
the cached CMOS index.  Which is likely to be all fine, but needs a
comment to note this behavior might not match what the underlying
hardware would return.

Thanks, Roger.

