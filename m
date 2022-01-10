Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F28D489991
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 14:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255355.437540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6uSb-0005Yg-3Z; Mon, 10 Jan 2022 13:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255355.437540; Mon, 10 Jan 2022 13:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6uSb-0005Vk-0P; Mon, 10 Jan 2022 13:11:41 +0000
Received: by outflank-mailman (input) for mailman id 255355;
 Mon, 10 Jan 2022 13:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6uSZ-0005Vb-6g
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 13:11:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7b6ae71-7216-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 14:11:37 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-wzYVxXxcPSOsP_JjxyztDw-1; Mon, 10 Jan 2022 14:11:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 13:11:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 13:11:35 +0000
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
X-Inumbo-ID: d7b6ae71-7216-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641820297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08DXWdVE3KliSo4u1Fp9Kw2rw19cO5U6NuHEpxecJJI=;
	b=LqgM6iKB4FHwmot9Vvm8rKFlDGTeXAMKf2YD3zDO1TCSJgquPDfBWHDuoMTDvszy9ax8gR
	LDAdTcTmSQGvG/QkUk1+YwT5PT2tih4nC5l9VhWjK44vsgKbWJtSWFoeUKbdFX52j5gev0
	/vv0LNAONP+2JocmoCfeg+MHZnjuUsE=
X-MC-Unique: wzYVxXxcPSOsP_JjxyztDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8lmXhjzShA9hoy7QpV7RGrT++07IO/F2iIZuir66N0qSDfbpsm5/yRpy2p1cpxBAPcB6VFg6o5oiXvTZEq/suwcrTPSAn22dIYq7cw1ufSsDIvrDzCXHfty1uG5xTkxDRshAczO++BpflkeWqDUrG9n/PIy283Tq2dA0bqfCPd3B6SSolG71cL2xe36s0qF1fIgsTnYr8SScMVWeilGzICdjsE0qKsmGoNDZ/oaJJuUphbmA2FuGmRUiQJ/iL/mEpXBDeOwVtFpSCpldkn1Zwh+ld3WdwFLSHtfkO2NVG8CyFG+QoC9sY4FX3G+YWd1VySQMmfmgQH3AuXw2u3T0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PMjNK2nW0KVCPWSS3zDDezwRSJ8z00zQCp6CWEwZuc=;
 b=BihCpKTNAk5UyjebVCT+5eUDtzWxSHzkxYKup5Q4tDkKbVbb5+hBJcrjjejI7bM93DKFIa+uviqilqirzBJZ8TG3aPRPTmY1WmAaN+QX8jFBun2T9D82CJU8IIxRnmMU3FWDNDUe2UEBEUTyrAIKIXA2KdlY04PhUnjz0W/ifnr/yfbrj/Nqgc8ctmDtvuvRY0unyJGRiiiaUMSFTdhMegpTYIynNfV3HeYprI5pP4jnrynJxul4i8AA4bXzVznpsGdIE9Bzn4fngVrLWJ4AUR+28iBLcewPlHWfZWAuc+yh7LP5hLGbPmI4Pxw2il1QCXc11HFg/1zt4WaEYR6ZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <539e31bc-3e68-9e9d-3bb3-2d0f1b2834fc@suse.com>
Date: Mon, 10 Jan 2022 14:11:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
 xen-devel@lists.xenproject.org
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <YdwodzmyvNwGJaSM@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YdwodzmyvNwGJaSM@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0007.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6addd351-7787-4e5d-c648-08d9d43aba5f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6478AE0F273B96BA4764BB0DB3509@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xb2vebHsh35bvZzJrWh61zxe8BL/HWeNo8oCG0cBcYx1FCfFCIFkpfPzeypl6MAS9CzqW/nvp4u488aWwMQz/QmZNdFxB5qt++Gi0HhlPyCH1oAHVwNykF6V6L4/Ya5DOFH4pQplctJbIXNuY3IAtXoDkzj2gomKEBAsM9rQqacpfJRAanvPLRvVGFtBbDCGRnLf33KWXQC5F/gWyWrSglgR5TL4x4Poow0BpCQizwo5cs2w7wddf5ngj/YTiTi54v1aUjmwHKRHXciMUXyqpb579H8eq8XyuzQZ+lc+aRFRv4I2lsak0hjDFw7yfkNC5QbOf3A3AtwQxfDayS4A4s/YR9AuanRN3kfVAThYFmbuB8k0qeaNoM0JBXRzlTnqXRne6DZ0v/yD/d3m90UNmfA6SnSallfN++/9gAbtYOzmOAbPDB6ag4A/inKTGzPDtXzU+hhvdB8EWwZa3EcZYl9OgVephmJQQxPyiW2+XFXf5KR18fwndRw0feM5wCKp1Ro3aum4o9IljDhfIDK5yP9sFEDpFXvwncIIwDQ5H7vUJC3h2fjg+Gpx/+Lr3pF+RZy8uraYNGvZGly64hs+xTpZkUIId1x+AFifGP/eHK8bTsH8enT8FMg+kt0F3l1AsmDUXMngspde/GAXB7Oyo2/v3ZtVLn0kb6dtpFPJJTrwzz8JkO4q/6YMOdcFZi17WgSJBH2yrOe2Kdt4yCxU+VyeEyNk2C/xjD3wu6ivTAY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(31696002)(66946007)(31686004)(86362001)(8676002)(6512007)(66476007)(36756003)(4326008)(6486002)(66556008)(2616005)(2906002)(53546011)(186003)(508600001)(6506007)(5660300002)(26005)(6916009)(83380400001)(38100700002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mhUk4j+jS0SAtB0Q7G5oYhpO4j/zUS3KQapHbqTRAXrYEBG4PvxCG9TUi7g6?=
 =?us-ascii?Q?/s0K4HkeT4s0CNZ9LqkS8FATQWixmDQmRQ8Yy+iv7RwVVVgmiSbK4uG9T6R9?=
 =?us-ascii?Q?WgMDpP+MjHgwemgY53k5i1T8vlRAeuPuh92gS6C3eJJSkUPDWSzfbkSFhD+E?=
 =?us-ascii?Q?4rQMa0aWEwzpEWU0OT/9a9tppgVr3uN5UNbZGUuyWkLGprMhQ6MxQnKh2pzg?=
 =?us-ascii?Q?u7fcrLzuASUfItAzKcqOyvTQ7mEGU8KI0Urbeo3WuGbxHBGwQfvFJhDe2U2o?=
 =?us-ascii?Q?28NEKeWSCCboIthrXPkX326EgOuxE2MRS1LDsD+o1D1DJhODQE4RmdEh52Jg?=
 =?us-ascii?Q?xNnVyP25rZPkvJBli3X9NOzrlUoA6ZsKd/YSMo2Qx7oXr+5OzPbKBan9Qd5l?=
 =?us-ascii?Q?spcKms62x6wD9ptS5VlOYHUg9flRPP2ER/CXUTN3k7thD2pfJH2U3fRRrtXN?=
 =?us-ascii?Q?BxdecsD5eLC0AHlwudGQZxvbxMbqhZlwQH9s3FXtglHoPQ5bhat1Kc7F2hkp?=
 =?us-ascii?Q?+ND2aBWdNuQVyl4vwmyZ/2hgjwRCVhu33/6UVRhpkbNjwwGCcCWLcTuGPz8B?=
 =?us-ascii?Q?O0rQ8pFTcCCjtyun4txnX5oZ9wN7C5rJtFHReRTXTgpmj5YrSpcpwYD5/GiO?=
 =?us-ascii?Q?RWlWiSpQePKpNzD5Zf1EJwRL77tBO34dns5Lg0WFD+I5iNekYuI20D3vogE0?=
 =?us-ascii?Q?kSO9RQM4nYzyj7t3Q99HOstqEcDp+X7xi8njOaqW+Krvf7ehmq9eUx3bpw+C?=
 =?us-ascii?Q?znCOl/ymoCl/0wt48B2R4kNHkWpSiYhzQP5uhwAOGdfd8/gm70ech52duFqj?=
 =?us-ascii?Q?dOesLj//S/PqWkkJg/IcF3TeH0hGQNLvaTamrJEX1wAzGQehLZtC+k235gX+?=
 =?us-ascii?Q?bheEbuIucwihvkVgq1X3gVQFFIfK4WDKgsl8gOcaJwmzCRv2QhSGirSN+Iya?=
 =?us-ascii?Q?1IhpQi0gPMEW/dtkmN+8ru45JFG9Q6WcdNJfJx2myef/wjNgdrMWhnPjSQ1e?=
 =?us-ascii?Q?iyxwdEhYNkFGAzmYubxwSYfmohw82oYDAtGptPg61RRZEedeFb9vUmvJ6XW+?=
 =?us-ascii?Q?3ttBAcLmLdt0MSdqU3hWKHB8krO3GMmYKeI2Pc2bC/203EpRgzU6+3QyM3Ar?=
 =?us-ascii?Q?WlYy/sNFpy8xj1nEISTuUfFydv70cTJXgtKdJVqZSFiLdS8Ltn3V6U6X2Ode?=
 =?us-ascii?Q?bwuWJxhYnjWmvzB0FuRV0lQN3cAEfsTQ2vTPWMIfEV4dWNeKuR403f2kC9SF?=
 =?us-ascii?Q?IrbVV8+UkBON6bixrDpESQFZlfkgMGJrEtsjkO+UmMMVC/3SY1lGCO66aRtt?=
 =?us-ascii?Q?jc+J8zC6PohoGqScUHrr/DzSM9+9r+pavlqSRUtJbS9uATcZ0zQtvv7ZRedf?=
 =?us-ascii?Q?TfeVJqFcQdQtYOt93gNKvnFHBnxraJQF0ZhADHmX+St2D1DtkFJj/3ntn/y0?=
 =?us-ascii?Q?n9Fa5r7qGsN+LJhAGfogcsMocvqPmtYZiL4PvebxxZE6ArS48cQa5gCUy1Q4?=
 =?us-ascii?Q?5BlGJAyob87S66cfrplbVBhnjUkSr5RHSgdMInc+vWIQjCJPpj8OACTSv37u?=
 =?us-ascii?Q?KSQCx5ylv2FVnEEwwSjyDlmVSALNw9gv+PI7lMo13FaBC1p66p6TDY/nmPN0?=
 =?us-ascii?Q?XHBFjqRxBXavQqojk6yGjag=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6addd351-7787-4e5d-c648-08d9d43aba5f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 13:11:35.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8XOBasH1T9SrVUBn8GGA1IoDFxieEk1+mX/b+Qn2otYnuzqQ25vtyu8r78wuJw/Exsn10Kn32kkQh4CcLWyTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 10.01.2022 13:37, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jan 07, 2022 at 12:39:04PM +0100, Jan Beulich wrote:
>> x86: improve TSC / CPU freq calibration accuracy
>>
>> While the problem report was for extreme errors, even smaller ones would
>> better be avoided: The calculated period to run calibration loops over
>> can (and usually will) be shorter than the actual time elapsed between
>> first and last platform timer and TSC reads. Adjust values returned from
>> the init functions accordingly.
>>
>> On a Skylake system I've tested this on accuracy (using HPET) went from
>> detecting in some cases more than 220kHz too high a value to about
>> =C2=B11kHz. On other systems the original error range was much smaller, =
with
>> less (in some cases only very little) improvement.
>>
>> Reported-by: James Dingwall <james-xen@dingwall.me.uk>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: Do we think we need to guard against the bizarre case of
>>      "target + count" overflowing (i.e. wrapping)?
>=20
> I also wonder whether a value of target close enough to the wrapping
> point could cause the loop to stuck indefinitely, as count would
> overflow and thus the condition won't be meet.

Oh, good point. I guess I'll make another patch to deal with that;
you mentioning leaves me surprised we so far had no reports of such.

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -378,8 +378,9 @@ static u64 read_hpet_count(void)
>> =20
>>  static int64_t __init init_hpet(struct platform_timesource *pts)
>>  {
>> -    uint64_t hpet_rate, start;
>> +    uint64_t hpet_rate, start, expired;
>=20
> Might be better named elapsed rather than expired?
>=20
> It doesn't store the end of loop TSC value, but the delta between
> start and end.

I don't mind; I've renamed it, as the difference between the two in
this context isn't very clear to me anyway.

>> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>> =20
>>      pts->frequency =3D hpet_rate;
>> =20
>> +for(i =3D 0; i < 16; ++i) {//temp
>>      count =3D hpet_read32(HPET_COUNTER);
>>      start =3D rdtsc_ordered();
>>      target =3D count + CALIBRATE_VALUE(hpet_rate);
>>      if ( target < count )
>>          while ( hpet_read32(HPET_COUNTER) >=3D count )
>>              continue;
>> -    while ( hpet_read32(HPET_COUNTER) < target )
>> +    while ( (count =3D hpet_read32(HPET_COUNTER)) < target )
>>          continue;
>> =20
>> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
>> +    expired =3D rdtsc_ordered() - start;
>=20
> There's also a window between the HPET read and the TSC read where an
> SMI/NMI could cause a wrong frequency detection.

Right, as said in an earlier reply I did notice this myself (actually
on the way home on Friday). As also said there, for now I can't see
any real (i.e. complete) solution to this and the similar instances
of the issue elsewhere.

Jan


