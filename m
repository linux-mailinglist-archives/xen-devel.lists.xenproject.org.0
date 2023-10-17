Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6593C7CBEB3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 11:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618150.961451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsg9D-0003ho-An; Tue, 17 Oct 2023 09:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618150.961451; Tue, 17 Oct 2023 09:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsg9D-0003fF-7g; Tue, 17 Oct 2023 09:13:55 +0000
Received: by outflank-mailman (input) for mailman id 618150;
 Tue, 17 Oct 2023 09:13:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BgJ9=F7=citrix.com=prvs=6472a2412=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsg9B-0003cr-QH
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 09:13:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c330efc-6ccd-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 11:13:51 +0200 (CEST)
Received: from mail-bn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2023 05:13:48 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO1PR03MB5876.namprd03.prod.outlook.com (2603:10b6:303:93::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 09:13:45 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 09:13:45 +0000
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
X-Inumbo-ID: 7c330efc-6ccd-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697534031;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vj19whVxZfVSbw0tpAdHxUDey/dDgrwBMhenQEvY7Ok=;
  b=K5A6UG0eyWNkcjijjZ8kKX505fjedAB0mZubp84XLn5I4i3dfXRA5t6c
   tcCnfqoz21PVMrAkIWkY5YGq9NFvt8cEBCQU4EdJANOqLAi/lvAuGmerg
   DAlthJnhIaXGvwKUfgV4gfHrr2b4nXuuE6ge0RCQ8DmwsxI/R9/4Hc4BF
   4=;
X-CSE-ConnectionGUID: Fr1rgefXS5a+4bDAz8PFmA==
X-CSE-MsgGUID: ZorBfCY7R2KpbKdVyByCZw==
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 125671220
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:LLq8OqxcZ2b74zTGSyJ6t+fhxyrEfRIJ4+MujC+fZmUNrF6WrkUFy
 zFLXD+EbviIYmT2LtElPd6/9R8FsJ+Gn4BhHAJr+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmPK8T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU9Ur
 OYXJT49VU2KxL687JupGtFCg+12eaEHPKtH0p1h5RfwKK58BLrlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjGVkFUZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LKRwnqhAtp6+LuQxPlwqlO49zMpUj4OX3i3n+iTm2WMRIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS4QWAyKPS7xyeQHYNSjpMatsOv8sxWDBs3
 ViM9/v2ARR/vbvTTmiSnp+0oDWoKG4qJGkNTSYeSE0O5NyLiJE+iFfDQ8huFIaxj8bpAnfgz
 jaSti88ir4Py8kR2M2GEUvvhjutot3DSFcz7wCPBGa9tFslPciiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrlxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:VV+FCaEO5d7bVPFSpLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-Talos-CUID: 9a23:zp8Ibm+a5Cs2u+pEYCOVv2AOQ9oqf3Pt9yrZYBOyJU97GIW7THbFrQ==
X-Talos-MUID: 9a23:wYtlFAhit5ty5Gm9Dl15QMMpBsByyaqFOR83y7YeseqICz1aKhyvk2Hi
X-IronPort-AV: E=Sophos;i="6.03,231,1694750400"; 
   d="scan'208";a="125671220"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THK2niNKsNT80q6Gj22duidAOHuBTR+HMCj9M8T3mUE14d+uwjDk8TBRBP2Uzi0Y57Hfe8J2iKR+2t19ZOMZ8hjcD/cd860zHmVEdelOHBKtKQngLPC4SNEsiFnmoyWj2+0S21zrukx9z2XWETE4llUWKefoxE+kd0OK1XbtgJVDmmwSQennDzU3YQNJ9cj7IAVfh+tWTifQ3ybDmF+2NbPGuhqRFDJUi91u10p6DsR0H6icx/zcFuEA6BpkscCa/UhjHd4TrwxCAp/JFxUvUVVphpbUKuHken40DqGHFupcXGNuqxBQ/5hMHB5vPkZgFYy2kDeJ5r4T8zhaw+MXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94uc5/wpCD3aYoQUZNORvAEM7NXrlohsKtpfDYHQohE=;
 b=XsaTwxOefF5kY+8u8Dz4x9YMZDC0qM/i58xP+XIl0LvGI8rLFhWo2G37vKfMxvNhWjIPQsAlXfmFa7EGIj4K0VluU+PNR5vkc6DTPqSxd6erO/oEdq3liJ+O/3K5HQ8RoVRJ5Es5cQ/lzIANh8ZAPy7RydBe97KSrGkzrHVhR2HPnz17R/N/4y4pkQd50WTSOWm4l3apL6+IaBzk5Il0Pc1hU5ygLRZl0Uyvut1C8DoWcyliOVTJI7t6drOICMe6ZZ4UKmcFtXa6CrA7L/KbyjpBRXcQDHvCGdlWoqXMom/camP9a4tuE5E1xsgJNDoWcmsF9sLvWJDYdV1tAVyK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94uc5/wpCD3aYoQUZNORvAEM7NXrlohsKtpfDYHQohE=;
 b=WeQM/OgBpSiH5CIRiy2Kps3CyOyrXz/YNfO4d9YNugXTC7XAcIv2i1ZId45o7gDkW37uLtGOz/N6yzzgbJVA55MLvd6496ANpzDIMfLnv6AYMfL1G76qaPFhOc/xe5n+aibUqEWmLXUrh/eKByV7gyzN/w/CsM51S4Ycq+91b3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 17 Oct 2023 11:13:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] x86/amd: Address AMD erratum #1485
Message-ID: <ZS5QQ8icFa-EQD4H@macbook>
References: <20231013153801.188324-1-alejandro.vallejo@cloud.com>
 <ca7a8bad-4d6f-1da4-b48d-7acbb5db401e@suse.com>
 <ac366b7c-497f-4a9e-873d-a961970c4ad8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac366b7c-497f-4a9e-873d-a961970c4ad8@citrix.com>
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO1PR03MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b017d18-cfe6-490b-70d8-08dbcef15d0d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kj72HMCugGpNBtqQTuldJv6WS44wGinJDyxGowGazO+3T7M+9boSKCPh6T6/HmS0+QUB4BzHy25/ULSvAJksYsd/46xq4GgZjY+MYzw5G0MuwElOuWk9LNf6EGtDaBfIgqN7eDbxG+LdVNN1/6nmSPT8PdQCcjf5c17dyULKVwRS2uXolAnd1voOQzK5TuHI0PajVW97pLUpbniKxe4adRPjD1PddqRd9AZyfn6tUfhFOTx4DbHAnnkMutTUiabn4kpN+HsTaetgFnn8gYxQeGEEqSoNH+c0kBBTzJd63ODkhrvQ4n21TJiuQ4hwXGo4cI4q2iMSgtrQnNiyrqNwIuX4rtlo5+7D2Xv7dusMtD+7a7FbQ72Ipau71cYeFyncGuoKnsemVn6t+JNw14vuUyOOwvvsvygvACZrPCZnKo0j4TqmjcwX44kPS4JdACTB3EnZ+TLxYYU/yRJDNKc6eClG1ARXMTOoHXWTisUl99uxbhyApXaJm3CL7EF4rZkr08LjJtc5mv4ZonBeTRNnRxMFVY2iJ7Z9uSZXGpGyI+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(376002)(396003)(136003)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(85182001)(66476007)(66556008)(54906003)(66946007)(38100700002)(86362001)(82960400001)(41300700001)(26005)(33716001)(6666004)(53546011)(2906002)(6512007)(6506007)(9686003)(478600001)(6636002)(4326008)(316002)(966005)(6486002)(8676002)(6862004)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVlNMy8zN3BoS3U2OTk3WnQ3aERCVnpLZUUveVh3NUFIRFVKa0xCVy9VaWcw?=
 =?utf-8?B?RGRDNkNpYitiU0t5Wk9pRG5BSUs4cm5BaW85YkF4TlB0NzZxWUkySUtmSGVl?=
 =?utf-8?B?T0lGM0RqcVc5QXI2dFJ1TEVuTzdjSkJUemlOaXcvSVQrelh1YmRTNVkwOTQ0?=
 =?utf-8?B?d0NlaGJyQmtiU1A4UDVBSS9RMzEwY29kQWh3Skg4cCtuOEVUVnkxeDFWQjJ1?=
 =?utf-8?B?aG9lREpWODZHeXRXZ1hMU2gzaHo0K0hlcVozczQweWJnQ3FKWGMvbjB6Yi9E?=
 =?utf-8?B?SDhScmo1WCtjQmI1cm05U0ZuZXM2VVZOTUtvQWxEcnJ0d1MvRkk1REdVL2d0?=
 =?utf-8?B?Z0ozaVk2dHRza1RjVXBkUXZYNmgyRHBoWlZ3RGRRUXNwUnJrUWMyQ3krbFln?=
 =?utf-8?B?Z2FoR2lBODQvOWxwYldZMVcwVVRLOTQzMEs4UEh4NDltNWlNQVV1cEkwTmor?=
 =?utf-8?B?akNwdTIvVTJFb2NXK3NERHB3M1FsOGc5bVoxb0wxRkwxVS9veW4wU0tZODQv?=
 =?utf-8?B?VzdpWVdXcFRGcU9nVkZPMnY3TURCcXVSNkVXS3YzUDgwcU1mcVp3aVMweHpu?=
 =?utf-8?B?cWV4cGFWMHd5Z3UwcU1FR0lFSmdTRFJ4K3BNdHowdVJnL1UrbVB2T1pqWUsr?=
 =?utf-8?B?UllJc3ZOQnMxMko0STlYMEd4dFlxWHNVRFRjeU5nUEFOUm5Cdm56N3lOMHFX?=
 =?utf-8?B?VVdqTUdWbmdSZ2d3Vi9QR3dFRWhxY28rS2JHOEw3UzRsL0xMUGVFbkJZbEQ4?=
 =?utf-8?B?Y210Z3BMLzlVUG5NTjE3YUZrc2tzVEVUTVQyZWQ3MmE4VVM0eWYraGkyaDJ2?=
 =?utf-8?B?NzBENlBnazNSQ3FjYUpuVHRwYkk2R0NiOEV4N1lQRGYwa2xKcjlLV2VyMGdS?=
 =?utf-8?B?MzcxSHVWNHIrSWZwbkFwR1ZQMTVUMFg2MWl6UzlCdC9jL1RpQ00wVnBjUFA2?=
 =?utf-8?B?VkYreHBjR3VBNDFKUDN4cjZyck43K0VHdGVFVnU0cUhrN2pmTEdieVloSmk3?=
 =?utf-8?B?Y0dlRFdJMFFQNXc1YjNSNTVXL1F0YS8xYmtxL0wwVFFZdmlONksyWnNEVzEx?=
 =?utf-8?B?UkJFOFAyS1JlYzEvZW9qWkF0bHhQQVk5SENFQUdQRXh2azJ3cjhzUEdXS3Z3?=
 =?utf-8?B?Z2c2ZDRlUkwzZzRoakt5MDFGY2pJZStQMm9nOFJnNEw0Ky9uTk9JbEY4UEtY?=
 =?utf-8?B?d3Q4V1dJVU9SaEx3cDA4YmtmQi9EVlFvT3k5SUEwTTJPSlQrNGQ2Y0dVUDRI?=
 =?utf-8?B?T2dvWm1ISXF4aU9tQmw4ZCt0NjRNME8yYWEzUFdHbDNlR283anZtd2Ryc21y?=
 =?utf-8?B?RU9nS0dhRjg4MVc4S0xCUXkyUXUxY2hiT0pRWlBQNjJkdTZ1TEpTa1B6TkNw?=
 =?utf-8?B?dm1YVWZEMGhuTGVIaGRnT2NkUVRUMGo0S0owcytoeDlFL2tDSXpCVUdpQ2Ez?=
 =?utf-8?B?OHBwVDNHQlgrN3VPK00yREY4SzhRN0l5WkRNUXQzcnBQSlJjRkxRdXBwS2Zo?=
 =?utf-8?B?UHNUYlF2VU9rOHEvOVJzSWp6aDA1TVM5RExvMHo1U3hSejdzM05RU2RJdm5x?=
 =?utf-8?B?VTNJQlhxZlNscUhrNUN1VHFSZlRFaitOanZhQkd4OElucVZ1bE1KK3ZiUmRM?=
 =?utf-8?B?bWlvdVN1U3VyM0dGeFdpV0JVVkRjSGovRkNaVmlHZ2tGbXpHNVBEWHpnRHRt?=
 =?utf-8?B?OW5ldDA0bHloYW14bE9ZTkI1RXlvMy8rV29sU3pGNHlMYjJFakxDbHo3dGc2?=
 =?utf-8?B?ZldjUlNLQkZLMnNsa3lTSHNOQk9KS0hwTE1OY1N1RjBLcXRJc1JLMTViZ2hU?=
 =?utf-8?B?ZlFidXFiOFQ0VzlJUWdGT3QzQVJhc0dRLytMU3pralNISTVGZys3S0tkZ3Fo?=
 =?utf-8?B?L1Q5RmYyM09xZ1I5RFNkYnRLa20rYXVZK0wzVzQxeVRpUFAyYWlmOXVjY1ZU?=
 =?utf-8?B?U3hTMnJYZ1ZlWkN6T3pWYUhGZzZWMzRIQ0NGcDFtcnQ0NnpqdGxsZnprTXF2?=
 =?utf-8?B?c1BzbXdqajFVcXhNZlJWODViYk1sOGErRjJjYkpYWGRTVzh6UGFEa3Vjdlcy?=
 =?utf-8?B?UUlicGlQVi9HQzkzN3BxQTFsQkx4dHRBamh1a0dhSzZ1OFZGbkI2bFlLZ3pk?=
 =?utf-8?B?UWNvR2JYcFVVTnhPTUxzM3dzVEJjUXJSZW9JK3ZpbUxrOEJLLzgxUzhEbm1o?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CzLE0psV9TKrzOmXKV1WIrryeYwH84n32o9B/8t5m5EtHcH9nd9GN/65F/GYV9A0j+27ucjuidJVYxB1svMSO2ldjpihostpYX8yfXF4h0vwQsuPxp1AkXAvmeHjB8VNjglNsmBpx7MFvuueJSMrKylz9+2PkE45HxlEUmYDdDz8TNgkc0t4gbMT3DCtW8uFfD6SrP7TZP5ArkJfHw08DlQkh2d6V9K7yw10pNYxQgKLXm8dYIwT0je9dMqlSL23gZvQRK6fXCHjRK5N3C8eWCgLFJayuDqlhRGFebkQ396teI+hEDEflkdhupocGnM/MnOb+BGiCR4AFr3vQ3PjJP1Wx+P+IvDfN4TQVdZ7nvhGiaA7y/Y9Rtyjx5/v26xRM01FdgMHE95tz1EnyPy02vcJ2suZw5EqP80D420a6dVBT0ZSqNMzXONiQT547S8fOIGBY0pWTfTSV4zkaaKEhwEnirv1PbNDHb4znZEc+8TOqM2NjL9QBlVMqI2LCbdwIAPOeyQnQziLmCdCib0PtbwT1gSICUpErW2rtN7pTvZrcqJ3mSrUYvLDDcnVAXEkhUYioSOHA2YikdrgFj1JeLIhYkKdHL4hdnVwFNNctOmnMOrJkQm9TMjITDQu/AMqx9Fow4gJDQ9+zzVptR2IjpaA5HUBgWWWNjekFgS4j5CHHN4DmE7nR6we56fWLX/5U4XmuWyk79VxrCpK0+RVRsx6FMIMm8nV73a+cnLqQdZLul0Dl+wvrYZtYCWZHMgLFqwagNGod2m/ZRxvLDY9wjhn1whUoiHl2qwVRSdTrKyjzkjle+fOioIpe8WbIp/V/1XvxquXnjJrmMFHBFHlKr4VdAy4DGUZl4B99rnHd0yAY8WchvrpqQI4ZlP5A+Gw
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b017d18-cfe6-490b-70d8-08dbcef15d0d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 09:13:44.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nC67oZ4lRStnhsuW6y9yQp8MK589Mf6uNP/IX26edMia8otJ3Ae5dkXI0wvnbS0j/wyQjcwZhu9HecHtLmaBNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5876

On Tue, Oct 17, 2023 at 08:50:45AM +0100, Andrew Cooper wrote:
> On 17/10/2023 8:44 am, Jan Beulich wrote:
> > On 13.10.2023 17:38, Alejandro Vallejo wrote:
> >> Fix adapted off Linux's mailing list:
> >>   https://lore.kernel.org/lkml/D99589F4-BC5D-430B-87B2-72C20370CF57@exactcode.com/T/#u
> > Why reference the bug report when there's a proper commit (f454b18e07f5) now?
> > Plus in any event a short summary of the erratum would help if put right here
> > (without needing to look up any documents or follow any links).
> 
> That is not public information yet.  The erratum number alone is the
> best we can do at this juncture.
> >> --- a/xen/arch/x86/cpu/amd.c
> >> +++ b/xen/arch/x86/cpu/amd.c
> >> @@ -1004,6 +1004,28 @@ static void cf_check zen2_disable_c6(void *arg)
> >>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
> >>  }
> >>  
> >> +static void amd_check_erratum_1485(void)
> >> +{
> >> +	uint64_t val, chickenbit = (1 << 5);
> > Linux gives the bit a name. Any reason you don't?
> 
> There are multiple different names depending on where you look, and none
> are particularly relevant here.

Could we make chickenbit const static?

I would also use ULL just to be on the safe side, because we then copy
this for a different bit and it explodes.

(not strong requirements, but if a resend is needed it would be nice
to have).

Thanks, Roger.

