Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F352B7D1
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331966.555606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHAw-0005A7-IX; Wed, 18 May 2022 10:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331966.555606; Wed, 18 May 2022 10:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHAw-00057X-E6; Wed, 18 May 2022 10:45:06 +0000
Received: by outflank-mailman (input) for mailman id 331966;
 Wed, 18 May 2022 10:45:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrHAu-0004rA-5i
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:45:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92b5a772-d697-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 12:45:03 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-Y1zHuLzXODmsH9AhWRZUWQ-1; Wed, 18 May 2022 12:45:02 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8386.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 10:45:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:45:00 +0000
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
X-Inumbo-ID: 92b5a772-d697-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652870703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3T4FCEKiM/CTDixmj3VrkfTyVY4s2eHzekCcMCYwkcQ=;
	b=fNGsJSYu1MMokkKRpZ/10GVn41ccir6S0SvFiVZ3qhkJdYUq8fmDgQl4otgiMnA4QJYryU
	isuPJk+uWHF91K37uWTNjfrcZAN4DxNBNLMGwY1J8b318r6J2de6A6y9QkhieO+GUP1lWG
	ljInwsmk3zd8fMahGKovfpX8PuuixpY=
X-MC-Unique: Y1zHuLzXODmsH9AhWRZUWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBbT7+AsyQKjyFR119Ehp/XnLUUHQ9IEH3SwCgWTFm95kKm6JwF4cR07wjassEGeDqWqh9pZBZJqdT/3gPxj2NJdo5JXv7mMAVcHRgVj66ypdgOmMsUqPQmQ0YdU3rcPn9aGUIf1Z+OOQ7TV+v+2diviWeALVz+wRHsPt2Et1T0zpO4pdeGUSPonL8YM2KomWtJKrWAL/JoqFfy2dW0QtiDxQg0s44p/teNHAxGr2W96bQsqMSC+1P0N7UgPTOPfAK0WxhicYzz/CAeoNz5bVR1qLue8xQ0JecMb+arPmHZuPGa7fTEdeRrQdSU95z7eV0oPTCJKLxspkOhR4NqrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfxO6lat6NUulj4RhVj5pUT29acG6GHwB2SMywf12PU=;
 b=Hd7cDoUd/ZVlAy2dRdtUBzc121zmuskXs1Adt7dsFzo1R9igyPNSPn1zpSpMfnqBDkRNP+O7EVd5TAgWDJmflDxAApAdVRXJ50NsO/0AA/RAh1p5P7NlEShSWQOQ0UcqWnTGhkR4lpZpuhDWiqljMzorIOsmgZj5NBvNliyBxrqRNSoI0FBZphNZBjv/nFjgfTuWy7xWjjjDDznxZLXVgroFULJPh58dAkI+S92MMVpqyjrVQXBZcEXqqjU8VDpJPX3yFr1m1/UGvuUTDdgQG7BEia2o8Cg8pxM9BndopUkZc6LdhEvnU10DMHYaiRXxqgGkUTN7KmiawgFCKp1QHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dde74acd-300e-bd95-9c49-412095b5e4db@suse.com>
Date: Wed, 18 May 2022 12:44:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20220511151423.20241-1-jane.malalane@citrix.com>
 <Yn57zsIVGfM8s4Ld@Air-de-Roger>
 <3db124b9-6ab7-f9e7-3c2c-13d82894bdbf@suse.com>
 <d24c54d1-cf25-043f-2a35-1670b5eaf56d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d24c54d1-cf25-043f-2a35-1670b5eaf56d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0052.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aa8104c-b0e2-4b94-68fe-08da38bb756f
X-MS-TrafficTypeDiagnostic: AS8PR04MB8386:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8386487A3D038644FD283547B3D19@AS8PR04MB8386.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VfHLEd5KoECNX/SG85B2+EH6sXeBNX0fgb+jY5m8I2dLP5vQem5/Jguh/SFYRTiswcr7ph+mHRzCUnf6RMuFUbf85AnAvuQSQ+ULNgmxhl4GG4PaME5eJIwLBxHh52AeYB5C033XtaKgN5+TWYMmylK3KwLrQMHInGNIWGA4PM7QGgk+RMWkXai2B6Mgg/rxU74WwhFCjrDX6qWF2/EnuYcUEea+th8+JDviFFyTqEdPS5VXfjcsxRVTIY8pXzuaPZ7evCIZqnHK8var5bTt3N1FR0weIRzgNObWdzjfduVwqGLbTnOXc9g0z/jogIqhZY+LdHdrdHwKs14A4WdiVLIZkN2nZjnP3UMUt9Zp7p/2PoQUQ+/gK5bSCdV0avQeoIiWVvjBbSTuCIWGWRWyHTe6omuMxlJwszAabwRRrP8fDlW1Wwq1rYCHkg+KaYhhkOPD/Y4kSu/xJTx4T+Bg84gpxiradm1xl1utHN+Fez7ltAFiFurew/UI8v4aaKdOsVHQ1m3pZg9q5NwAF8gwVumF7jjBXM6qkon1zTBZe0xc3HXbfs8qFb4/YFksZ3HDuosRXRIa5/2K2X+hZp1zLwdo5RSyEzuURK+G6HK0MZvxq68WvApLqUg/UOxjDg2I7fB1FhCOvLymmgnW30IfETfSiwNa20qGh/chXIJRAQshDApVVDMiqpvCmFKDlcKd6kNW9ivtPLAJwKgxYM5ewdygH4cvYAKx2E3QRzOLN1s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(66476007)(26005)(6512007)(316002)(8676002)(53546011)(6506007)(4326008)(2616005)(83380400001)(36756003)(5660300002)(38100700002)(6486002)(86362001)(8936002)(2906002)(508600001)(66946007)(186003)(31686004)(66556008)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CIIw7G1TKkl1Q7TBpKcbmnonNj/CD+PUWBxlZgphC0XVRIQdl4FSihe1FYNL?=
 =?us-ascii?Q?2npjpGPJ/Th8m2unfr1Dvle/ggurmQoOS/ykWkMHRG4hD7xef+iW39F5Ydmw?=
 =?us-ascii?Q?DBiDFLwXkbrHBx6x+/2I7dNTBh+U3fLIoUgUa0uJLv5905Z1xbasjJZNg2Af?=
 =?us-ascii?Q?TA7ho4rWMkmoU6XfLFD+H4wKRDPldDNIwWqoL43XbLWnEB+JzNeFOyMKaTR8?=
 =?us-ascii?Q?wVPkaSJ1T3j0kN0KVba6d5KoSang5OiQhYVC2fjM445mKLGZnGr+6s2Ur1Vv?=
 =?us-ascii?Q?GYZ8xTmkxBvrPQpueqlYeLgDIfkbCAnJ6XE64oGIhaGWfQeANrmO+9k5x4ic?=
 =?us-ascii?Q?GQqHaoqrYdApm0wYnFr726mIs6qc3fFobtVirzo9mJ5UI2R4YPjl6jHpPwJi?=
 =?us-ascii?Q?dT32bzcrHotoo3duQaU8qpttbixoZmJPwksxz5k3I+j3Au9sHMhaUqx4/28E?=
 =?us-ascii?Q?Umij4Kd0CARynsT78Fq9ZAYCLHl9zeCjf3r6uPCd3x+HxC3VWPBQ2Gkc8xuE?=
 =?us-ascii?Q?ehIxdgDrPioKAB3U0XlEeWcWSflAjnh045450SIv4beY07zsmqLY591PAp8Y?=
 =?us-ascii?Q?t8uoj9ZHuN74BNexwR00/ETl+wsz5/3qE5XsSgxf1cnu005XssXW6dpJsXQC?=
 =?us-ascii?Q?SCNryr1JHdFll77f+yzUe0pT1qIeOwEz6mgKRjqAvLBg1sT10I5jC4Q6xG/S?=
 =?us-ascii?Q?8zO5I3VSG9IaT4A+AV4NZ223HM6OcBuboYibg+DLNE+QdGQ3DtXf6xEpHJ52?=
 =?us-ascii?Q?1DyFe6a/PpEy/prQCh6xw/wvYYc0EpMXXFFhOkUsddySghTU8ESrAyf/UEPK?=
 =?us-ascii?Q?xMuj+f/pBrhPQiKluN/Qj9tuQYL8M9U8HoneH033v1rt2brnTUMKcUkI+A2R?=
 =?us-ascii?Q?1BMh+CWt/kXSr7WMGRe/0CkMvQKegmgFtu6eRcqIjJQV2e/jH72aEVhQD8vF?=
 =?us-ascii?Q?oMFUzngfxfQp9Mfl6jZn73xpCj3mh/Lzt+kb3/fYaifM/4q3Y9BWXqCdRHoB?=
 =?us-ascii?Q?oZJPi792BKbfUzgwe8x+GxNRaQ3xBkPPCzcXAS4dzUvFUobDo9ikIDsladdz?=
 =?us-ascii?Q?g0+u4+U5MKiHPkPpQmsM1BRQNcFi2B7ZAMdl2CxC3fHUP7VnAIzgHKhkVywQ?=
 =?us-ascii?Q?GRuJK4wAPImqpVfzFe9WfZyYwJ9OikUxs3kBB+WQA8ttpUhm5n+na2Rx7Kuq?=
 =?us-ascii?Q?XQb9W5/sSmcvZcXh57AMU6VZykvPDtSrChE2u/jW28WxR9nKwMUsvCbsW6Ix?=
 =?us-ascii?Q?8Dzshga+YJeB/S7wzgydrQfqFC0dH3s5XiB9QQ+dxex/44OVi8e9kR1Ks1jX?=
 =?us-ascii?Q?XtwiO5wg7Al+ZMp73D+mKhgJzYJTnjkxUX+B+bXwp317eLhYlApqMOzZWkxx?=
 =?us-ascii?Q?E9BWn0LoKD5pLpCywt1FgmUWGpv5eAf2w/5Mlo8VUw9X7PY+rerxbraSGk5i?=
 =?us-ascii?Q?QU3FzZKIeKjHcwjFQKqw4GJdqtcNoqJOgIfyTlYMwFQGxmoUVtkWWh0DMxNp?=
 =?us-ascii?Q?hmt6Q7nbWIF9Co8coFFRzxzH0x2koYzJgYyQ58LnJtRJ2ljIALSN9xvX+KNG?=
 =?us-ascii?Q?tb3eJmMcG1Uvh4WmtYXuDECHCgVuy4Tmq3UzOFccscBG26jCxsie7H7JJFDx?=
 =?us-ascii?Q?1O08qzLXvM45pfrd1dUnb1sXMwQHEBbRFIsrJaRmd28iFdxBpjAtep7aCHcB?=
 =?us-ascii?Q?GufSCZHr2ZvWPk8vlZ+zFT26sEEi95024ovXiwCHQMa+JZFAghn1//mqH8Wl?=
 =?us-ascii?Q?lyjZtiZM/g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa8104c-b0e2-4b94-68fe-08da38bb756f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 10:45:00.7715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3gnwdpCx8UMYzjd7bqTOs0ucNHzYdx22v4tnlJDl3p6Go0ObXtmxMOkYINz8axFOehDWSyz9VbYQF/0Juy96Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8386

On 18.05.2022 12:38, Jane Malalane wrote:
> On 18/05/2022 10:09, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachment=
s unless you have verified the sender and know the content is safe.
>>
>> On 13.05.2022 17:39, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, May 11, 2022 at 04:14:23PM +0100, Jane Malalane wrote:
>>>> Have is_hvm_pv_evtchn_vcpu() return true for vector callbacks for
>>>> evtchn delivery set up on a per-vCPU basis via
>>>> HVMOP_set_evtchn_upcall_vector.
>>>>
>>>> is_hvm_pv_evtchn_vcpu() returning true is a condition for setting up
>>>> physical IRQ to event channel mappings.
>>>
>>> I would add something like:
>>>
>>> The naming of the CPUID bit is a bit generic about upcall support
>>> being available.  That's done so that the define name doesn't get
>>> overly long like XEN_HVM_CPUID_UPCALL_VECTOR_SUPPORTS_PIRQ or some
>>> such.
>>
>> On top of this at least half a sentence wants saying on why a new
>> CPUID bit is introduced in the first place. This doesn't derive in
>> any way from title or description. It would be only then when it
>> is additionally explained why the name was chosen like this.Indeed it is=
 incomplete, thanks for pointing that out.
>=20
> I could add:
> "A CPUID bit is added so that guests know whether the check
> in is_hvm_pv_evtchn_domain() will fail when using
> HVMOP_set_evtchn_upcall_vector. This matters for guests that route
> PIRQs over event channels since is_hvm_pv_evtchn_domain() is a
> condition in physdev_map_pirq()."
>=20
> Would this be enough clarification?

Yes, thanks.

Jan


