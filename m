Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFCD6D048D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 14:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516693.801236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrHp-0006ZH-Bd; Thu, 30 Mar 2023 12:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516693.801236; Thu, 30 Mar 2023 12:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrHp-0006W4-82; Thu, 30 Mar 2023 12:21:49 +0000
Received: by outflank-mailman (input) for mailman id 516693;
 Thu, 30 Mar 2023 12:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phrHo-0006Vy-70
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 12:21:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e744932-cef5-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 14:21:46 +0200 (CEST)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 08:20:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5474.namprd03.prod.outlook.com (2603:10b6:208:285::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 12:20:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 12:20:49 +0000
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
X-Inumbo-ID: 6e744932-cef5-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680178906;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+kkj0aixR+SmroELwMn6dm8iCbGt/gbMY0StBirVTt0=;
  b=O+n1GljkAO4xNF2JuU9G+Dpd2N5LP31Pm2astI6wfE+5hIweqn4HMMLn
   /QDz87yjf0glbgn1HH33d7oVHszXuKIe5pDlm3PXNdt6r0Rd3fgjn2MMr
   G4/VoPtYINwV2P8a19ecbyQWjhNpl1IM84Ol7/DIcAFjqcLK33V9fKnah
   k=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 104077902
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:raXuB6KIPIqhO2RqFE+R45QlxSXFcZb7ZxGr2PjKsXjdYENSgjQCy
 WVKD26PM/+DZ2X8fIh3OYW+8kwEvpbQn9BhG1FlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QdmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5uGyJg5
 NocJQtKTUCeuemx346KUrhV05FLwMnDZOvzu1lG5BSBUbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTGMkGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHunAN1NReXinhJsqGaN3GwpUxsHbkPluf6c2m7kY+4HB
 WVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9MW4HTT8JS00C+daLnW0ophfGT9ImFbHviNTwQW302
 2rT83R4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFfwaByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:Fvr/D6/XWPdwH5g+Hwtuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="104077902"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQaZTSSknnF8RBl6/cQv2HsamZT0Onj4pHeFtPVMLG9uGVu6iGSezY7nuzWxrWNCQtEmjKo8hDHUe/U7pONyCQ0uYxPWGU+q6KIRlTdB8bfoDngjW0rabbE5Drv7OhTWxP3rEMpPElJT/gRpSzsVWAwYLjIF5t7PhpF0CEYbVJHrbFiP1XtkCW2Uv/5WzLNWzkEDsrtOGoVUejBzwwSdQNghL9AdnKG4i5xvJSAiepxJPUWoXe0mcFFKvJ2f37TKxxGv38v9OX704zgCdQOq1hAhb5WL8tmND1rLz2QJb8FIFrIoUEKdUvxjTuF9b1JWeBNKATz+YihZZ3XlZHQXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kkj0aixR+SmroELwMn6dm8iCbGt/gbMY0StBirVTt0=;
 b=i2fVoe7LCh+OPvar6P2l0BSDwI6pBpPcrASYRm66Neb3lNzJuzgB+wmo08+xAh0y6UKh9aX/W1djbkAyUS74kduy+YFBMkQNFZGngWcCy3P75HbVFwHh45sr1o0/0JvQJadFbESQLU0bC6fyaIUIFAvfVU8hXMOjUv59VyPIQoynVN4d+2c5WiF7xlTomGIZKeq3+eI0STO7HTOBUqG0asMYa8WLMTDOa48Z0ixPtuxVMH2Vh7iU9yYmTzd4Ae0p+d+RnYHJG8gXTIl1Dn3XdhSefBxfX9Lq2bAZtOLCeFzIibtbkrhhku0tLgzPILFbjduLIjayruuY0XlLQ8nxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kkj0aixR+SmroELwMn6dm8iCbGt/gbMY0StBirVTt0=;
 b=XDTXbrgrqUdJ3HAw0zoZT2n9nsbydnnPspHLGy3YD9Pg0e8JS2wM5puGxoW2C4vCc/Pgp/MKjqFdbE2qvqM0GCP+pkWir+wMevs3K7k3858YJvUuHhiEkYJ//JZLB2CsRix47VqRu8sGWAdXo5gT9X+EvUHMc9nGvjFi2j1QwJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b8e4ee37-0b04-c5a7-93d5-bb8153db0f49@citrix.com>
Date: Thu, 30 Mar 2023 13:20:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 01/13] x86/shadow: rename SHADOW_FOREACH_L<N>E() to
 FOREACH_PRESENT_L<N>E()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
 <b0b576db-08c3-3e2a-e3fe-7a64db871ae8@suse.com>
In-Reply-To: <b0b576db-08c3-3e2a-e3fe-7a64db871ae8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0223.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5474:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ea71e2-0c4d-40cb-e757-08db31193277
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mJTiKYOYpjQaQ4f65+xLdPLFxiPZclanMAXQ2lIfM09apWR6iyjNVyEkEnPEKaIfgMiUQeuOGj2/bx2JpXqbb+shXug7Dbg4iJw9w7wyxpgnCssukmDVSj1cN9WQk1+3FqU7MCkvbujbZomF/4Ac/AqxFYbBoEKqXYKMmsaTtgLWFMC4oQGMshHkW7cHUzXQTulRQHZUMtR5OgzDm252Qoa2VZpQHjwcrMVJBCDjXcagAOOKXdZN7O6UzSRMxn80O8AOLMdaBSMDaPBZMbkXNTa0Wzju9oyHYrIpGmrnIcQ+Yscc4oAsQsKJ50FdB//3BWJLi5cB78V2BWlmUvOuZDt/QqXERa653FaMPE9FyFNqDqPfUqSZPkbdVeH+EVTLmVdRp/saJRLe1O4XMymYEUPZBNd1/Yyddv6728fhcgYbTiDAStNu2BJwOBk7fuVuEeWznwHnsjmuUGoUpsW77bYgi26eV3NcqJNHosqYmMNTkHl/Rpv9rtKIGChWr8kVy5lFDF/7oRUTMeXoYbR5D8N+FbYL5Eud4FLJCSll4ffQtxby11g4DHX5hQW2sCxc9qSTUhDPizc77YJiUcfeHuJ6Fdf8Bp42+0bB59kc5SAIecV7ZkhAd/tO+bVXqjoKFo0OZRCapJRw1rKXhYEftQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199021)(2906002)(8936002)(5660300002)(4744005)(83380400001)(53546011)(66556008)(26005)(186003)(36756003)(31696002)(4326008)(2616005)(66946007)(86362001)(82960400001)(8676002)(41300700001)(66476007)(316002)(6506007)(54906003)(110136005)(6486002)(6512007)(38100700002)(478600001)(6666004)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFA0K0N1Z2I5L1dubHFMbkw2eFlzZlpKRWF0anJ4b0NNRjNsT3hLRWpaaFlC?=
 =?utf-8?B?cGlvOVAxWERmRUZhaTVXZmhxUUlIM3U3UlkrSHp2clBSOUl6Szdaa0M3UmhE?=
 =?utf-8?B?cVdnSnBvdEhVUjBhWmRNdVdhOWlzTnc4S3N0ZU8zOHBPN2ljbDI0Mi9zWS93?=
 =?utf-8?B?VU5Gb21RY1dncUpmMnJZb3FOOWllTUFIT2Z1ZnNEMGIzZ29Zd2tsdWVPa2ht?=
 =?utf-8?B?VFQ2ZFY4R1BiS0JuMXdvdzJ3djlkSTNYVUt0VjVNdW5QTUpUTVNsYUtGVlo3?=
 =?utf-8?B?SHJsZjhxUHUya0kxL2hpaWNrVkV0NnVoL3VKakxiU0VnV0xyazFZOVhLY2tl?=
 =?utf-8?B?ZC9lQllwUWYzaXBxblJvZTMxWkg0SVR6cUYzNXpXb1cwbGt4T0l2M3hVU3g0?=
 =?utf-8?B?TGdiWi9BNDd1OFlUSXF0eis2M2dXN1VrT0QrREcwU0FXeDN6VWxXNVh3VlVV?=
 =?utf-8?B?TGdOcVJYR3h0Z0s4MWJLWVJ1QVB2cCtKOTdpdXFySTNpVDJ1Sm1DL24rb0ha?=
 =?utf-8?B?cXg2WTN3OGNRSExKSm55TlhFZldsQkw5TEJGeHgwNlExSE1SN0dCTVl4N3VY?=
 =?utf-8?B?YmpsQi9IQnVvNmdpZjJqUDdmaGxSL1N3VnQ1Qm9kQnlGT2t3OE1UamlzYVN4?=
 =?utf-8?B?b05UZnFhT2ZQN2RkNFNCNzlOTzcwSXQycTdibW9vcDh0cjkzSzhCb1MrZWpv?=
 =?utf-8?B?WWdMZVNDT2tiVjdmMFZ1OEh0UTZValZqb3FoL3JYZktzVURrZ2JKYmlWUzJD?=
 =?utf-8?B?SVpJZWQzTkxuWE54YWt4ZVNRMEpaSnY2NDM0Y2FwbkxWMWxZQTY4YWJYSENs?=
 =?utf-8?B?d2QxejFSQVRXcVVOelg0c2FIcTlzQ3RIcTJuaVVaQk9ZSU9mMmdnRTlXM1U5?=
 =?utf-8?B?Y2sydG9oNWFQWVdkampJOTVIWXZGWlh3RG9RcTA3OEpyM01BenBhYlZtdmVv?=
 =?utf-8?B?bUYwUW55ZDJWNkFqZ01KV1pmRU9hK3FXdnhSanhwcHRTVC9hSmV6a1pFOHY1?=
 =?utf-8?B?eWRvdGF0eVRwd2FnWjZtRGFxVmowWTJZZVlEZWdoYVZCUWI3UURRSlJpaTRp?=
 =?utf-8?B?amxqYnRoK2pRNC9LM2d1bkhLZ2hSVkVmMG00amx3ZXFBWkVJMXlTVnNYbFNa?=
 =?utf-8?B?bWY1aEZnWGVYUFdoSnRuUDFqaVQyekdRaStzMmIrb0ZMcVlYdVlOT1FpTGhu?=
 =?utf-8?B?blhjVGFSTmh5M0tLNnd1UFZ4RnliN3hpNVRLWTZoWHFYbVZTWjRXZmZqekZw?=
 =?utf-8?B?U2FvRHA0cHRRczBtTXBkNGh6QUZ4dGVMUnFsbFlIUnN6OWhCV3Fuaks3aStt?=
 =?utf-8?B?eEpOVUtsWVJ4SkVmaW8xZ20wQmNGUnQ3cE1BdVpGRDhLQndRbXdUQjR3bVZI?=
 =?utf-8?B?STdyWmhiQlc5UHR5U3Mva1Z3aTh4M0xOdHpEcUtkd2xFc0ZOK1o2cE02QTlK?=
 =?utf-8?B?WEt2bURVbTRPcnc0NUY2WVhkb09PSlpIUWthVjdaK1pITDVnKzNTaCtWMTla?=
 =?utf-8?B?S0ExSDJhZ293cHJ3ODJlMC9ReWNjUXZYZXN4T3NZb3BXM3hlYjVlYmJ5MWFs?=
 =?utf-8?B?VlAyamVUQWxDRzEyN09YaHZGZEhtZkdGaHIyeWozdm5DUUMxRkJrM0NhNFFJ?=
 =?utf-8?B?TXhCMWVHdTZ2bDVUb2hFZWpDMWwrRnZaUFBEelB0QVplUFZlNTVQUmhraXhD?=
 =?utf-8?B?cWVhYWxGdGZnOC9kMmFIZHNXOFc0aVdhOTIwUFRuSUNKUFBvazNoeW9MY0pu?=
 =?utf-8?B?V2hYYnRhRWwzSjJneVFHeTIzQXlmZXZXTzNwdDllbXNUMElNY2tybjdwWjla?=
 =?utf-8?B?ekNhQlBXSE15K0VIdU9UVzk0ZTJBKzRvaGo5TG5CT1hNemVibG9HbFVkT0ZC?=
 =?utf-8?B?bXBuMzh1Y2VkSEZDV1NuVTRYSGk0dEMvK3RGaUthRlVrdFJTYi9ORXJsSHEw?=
 =?utf-8?B?dEFHSElYQ2RVNXA1WWpHS1g1R3B5SVNoaXdsalF5ZE9IOHVRZ3BNY0ovQUxx?=
 =?utf-8?B?U1YrYmFTUFQ5dUxwMGx6dm9zQ0Q1NHBMODhGRWpyT0lWVitOM05rWUpkeTFK?=
 =?utf-8?B?bkp6aHYyVzA0QkpRRFk4Rmd1NjZ2QkJtTjVWekYzcDU4RmQ2elcyL2JqbzFZ?=
 =?utf-8?B?Q2RMMnZJSkF4VHVEbmh5emlrdkpqdkx0SWxpQlBhOGxKcEtBWjNxcmZydWN1?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qqODL6evQC/AxpG9Qw+5VR0KH6MRb/QssG6XI+906F4wzAU3zsrme+GZHPO4URjpVxoTooF1fwOLSiEFp6gCSoEDorjISRTp9i6aE1NHerWgNpkflf+kkos69b++GfezA43LVlcNNyLymj8K75dBSKrEm1h0ZzZoGIkDGOsArmD5FFZiRoN8DLWhhz1sqNyp2HVCAdvqXLS4Qn4941vUteFskJW2/oarEcISwlSgKhO+BDcZjCY9QtVmZ/5X1NmBoPMlGax+Ft0OuykHR6K5V0rJLUgeCdY5sfOT1zXv+6/smACiliGBGBiz4o9+2kb1J/kMaB/1RlnIbspx7S/meLy6JSy+EHpXoNLpQvr5dSfidLoGu4Nj8quSUYDnhQX1GZJmW8pe7HbRp0AR2CZiD+lPLIj2OwSYk6H92C3UlE0vPOS5UOhzhQtsL3Kanp/Yo3fB5+aRMqliZhpyY2vdhFVdQwHgT3bN/yPAuNQnMA9u8hAFs0VIRJgNNy52oaU7BTfRmLc1D1q4Cv1wIhdnnlbtvwroXIj1nrWpiZuJKmS/jigg6pPp+BlVSRExSEJ9b2CmWQADesEW3hnhxMd9e9XFqgv+Dut4w85sPUtz33fZh22D5340EhCBX8n/te4wvKgsJUk8rioTZjyAYx1Xv94WkW9MDSd3V8ofKbV5NMFn1BCrT81iKgxH2+7xfCoGX052WVbaaS6Ig3+wUH/xKYlNEQFCV4FQ1ffJ/uhZ2qxYye5HhPnO116a5sTEddsScnrjB9S0njJFP/U7HzsukCOVlGgVrCQIkKEIkAPTVbvTHEnpcLSVIDnSbxjbutMrxcBlVv2zyjLFwVESdtRjmQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ea71e2-0c4d-40cb-e757-08db31193277
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 12:20:49.6395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVrzJFrTtktB4xw2RLO0F71OfP3DEIGGDwEal96mvtjqyQt0jG+Yydc5PjyqxAwziGPS7Fud+pjJ66ZAvbkHHBatZ9YYxFqodNgh8QFeL1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5474

On 30/03/2023 12:24 pm, Jan Beulich wrote:
> These being local macros, the SHADOW prefix doesn't gain us much. What
> is more important to be aware of at use sites is that the supplied code
> is invoked for present entries only.
>
> While making the adjustment also properly use NULL for the 3rd argument
> at respective invocation sites.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

