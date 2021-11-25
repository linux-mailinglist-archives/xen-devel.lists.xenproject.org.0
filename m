Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F3F45D7AD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 10:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230801.398982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBQT-0005t7-Ve; Thu, 25 Nov 2021 09:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230801.398982; Thu, 25 Nov 2021 09:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBQT-0005qP-SJ; Thu, 25 Nov 2021 09:52:21 +0000
Received: by outflank-mailman (input) for mailman id 230801;
 Thu, 25 Nov 2021 09:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqBQR-0005q3-Nq
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 09:52:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6035a8de-4dd5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 10:52:18 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-ZXD949WvOwOE3l49ZPH1EQ-1; Thu, 25 Nov 2021 10:52:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 25 Nov
 2021 09:52:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 09:52:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0054.eurprd05.prod.outlook.com (2603:10a6:20b:489::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Thu, 25 Nov 2021 09:52:13 +0000
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
X-Inumbo-ID: 6035a8de-4dd5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637833937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COssJVFtwKYcpQyXsWbWuFPt2bILuf630drMuaUHEaU=;
	b=k2JbPn/6t+Pn3V2JDDgCOYFk8n7dfYXJIe53LgLCEqPErfxPXGBrvteVbZp0hikQp7QgzY
	1WTdlgzWsc2c+B2mpOMlgtwDcmtIUJuBjWVlL1KDMkIceIhfiNe00jvQNnDYeIuKOKDGib
	WGEIFQ93+BJIxjBUT5armfT7BWvgAwk=
X-MC-Unique: ZXD949WvOwOE3l49ZPH1EQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIJYlCaBs6D/mKbO9EyHE83BwY/6cr/jorj4FNCcUkxplrLiVY0kTHZ7i9Ey8Ind0Mk8Cgk+KE40qIJD9JDToIIVXna7JyU0aCCVAmS7m+B/zqT5/aIHzxFToj+vFwx5PgzMV5fnVALHbfgpOORHxXAQvslI6I/UK6QKOnSc2NmCXxrulP5VRCjjkFYNVT4dO+7/d6o4X3xLgHMzRPrk7qMGl7QWFw0Gsq1yTk1tgGawMicIrwLbrMPXUnsh7WXwX+Femp7Sytaz3zk7VolsLzwpNK/EZzx13Qt7jO4NTUq290I3xLbRHqwJou33qog5gPFAaxDc0jDuuVn5Za9hdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2Cpb2ok8IZX8zUMO+dRmkhiQVIl+9Ihb7HHfxqLEc8=;
 b=K79JcQB9ZEi9YMjKgBPoThqEjVw81tZnsED4nKW8fUOBMfQOnMy02EoWFLSN1eYa7Z8deJjydMDmZ5KEITZgIY8I5S7dNoiQxdmAOk1ysg+nZvkadu2G2j7quxE/HKdStIkk1l3MyRJK9SjYRCj0OfTjKTmSvrqyywMLwYKujBizZOUc/x7MXYofu5khICjjsWlAusSa2DpnhnkEigIodez3H8iGQgImSgzDChywuzW7gnIrpWVjvYxCVti6bqD7eZKyJ9vyRzcRtX83x8exqlQIEGBExyZxnR0NpFvTXEXq1BdBS0wn2Uo0eXc7nTWU718lq2o1eWm0rrPynCE+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <614efba0-a3fb-7ddf-1fe9-d4fe2feb21f2@suse.com>
Date: Thu, 25 Nov 2021 10:52:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <cbe791cc-848f-8511-6974-2c9e300ea66b@suse.com>
 <YZ9WSfy3pYp8uzqI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZ9WSfy3pYp8uzqI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0054.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 494d82db-5a47-44bf-116e-08d9aff941e7
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304906745F87BAA7D6339C5B3629@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aen1l8f4JdgYZ9ZhMsq5PuizRnHka1LYCpZ2pkxlzW6Lj+WMFLjHE7rg2/FjEZK86dQSHxaffyH6YA8Way8GDcpOKEUOpH+oKLl26+RoHhVoZEV1ObL/LQTuNPzJAgpm7JgeNnO+TBDYt1GOTP5MUAjG7LHOfJ6MJRSEpfHIhgV8saJwZCxhM+qE0hkshUCh/NbclmOQV9YVI55EJaONgw3r51RGj5DgRX6D9WXeQZK2nSl9c5JNiz7jbKAv4GiUs8em/s3g6Bwc/5to/pB7un6+z40xzwu824huXL/K61H9rP6bddC4/3wxxs8o7SXnuWYUah2S8EW35Kz/V5+yg1wq18DTgW3wOoUSm1TELvAYZCi5Luc4eFEBKP/7cGUOlrFkEsvvWX9MNJSysMQ45AkZaw+J5qZh9SqYJbnXU1RfiUw0lCFXgDAyBED0qkpVeDFLWWGpCF8G0Fgs2StDXH3CjNphjMRJBx5HPEna7APkVtaVEnD//DjMpCDeGwLHCFdUKPvziLE9DA2Qp6BwTIEluL4gYSLXUWeucTQA3wRoSAaa8WTZJA4FHUHPwGlcEJjxJ4yy+HAWgYSdKB3471MEG0pWuZLUOzrntI/B+v/BRHO5p9qzGB90O5bXODuAbnZR8J+mHpZ8fGFqVmEP3ndJgrPeVT3yedFnT0FQpks7XDBRf4fkx2GJn6aB7kyC/R2nL1Qbok3J5gxmIveALUhw7pLlefe5rslXLtV/mUR3vuSYbvF/GTpMxJGKPrgGv6dLWIHccvcH73APcpsh3wuwxUFI10Shj3y+6bUmIhmej0bUmwWSaOnxdqQrN1IbDeU01FCtxD7d1mhDzsdpJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(83380400001)(6486002)(8936002)(31686004)(4326008)(186003)(86362001)(38100700002)(54906003)(66476007)(31696002)(316002)(16576012)(956004)(2906002)(66946007)(26005)(66556008)(2616005)(6916009)(966005)(508600001)(5660300002)(36756003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8OH6SzC31OeVNfMYrxmVF2sEDXZXhGgVWQSYJ3EdVyTH2Oqw6kwt0eWhW7PF?=
 =?us-ascii?Q?tViJhXRnO31aPlY2/O7FFW01u++v1u13DmoWMJgqhINyL5AquN/ilvB3kZfg?=
 =?us-ascii?Q?C6JvzlYkeIigCIDmwN5EXAp/rAk1Ug1JyH0d0uzVGtYfsKQ9lIdMZKHjrOWi?=
 =?us-ascii?Q?leFy3O+uFxArOE/PmJtS6aUfPne44N1eG1i/VmxpVncDepmR0AqJmBM07Ovy?=
 =?us-ascii?Q?LgD43+XjaIIWiPa8LdlhzC5nu4mvVO7gQN62KTY3xSBT8Vp+LhiblzB5R0n3?=
 =?us-ascii?Q?hh5IPIx0yiWM9jHllBHQ6dGx5JCdSbgEqxzWfIGNOEjA/k/FFWyWGobmSRx3?=
 =?us-ascii?Q?KYFiZZZpwA9As16sZ4Z3I/NKpFrJcgKpnXbcVooLMDRElgQvYhRIW5k68b+6?=
 =?us-ascii?Q?vfTg6AHC6NBmNvpyuDUonlxoTbkM+EWHPkjhkx1QbP95BzIaOO8L3TMoV14B?=
 =?us-ascii?Q?hCmfE1p8806Xd5Mkaibmfr6Pr3vbzjsbl9RLeBxTgKx545aDAlb7tH7Ke+O1?=
 =?us-ascii?Q?jr9iaRu6fjZjSZNplQOnNZKt3xlXVlEuFP0nLk8hFCqRh6Pc5zToCijIG+W3?=
 =?us-ascii?Q?k8arsrKDo+Ly5aT3T2WP9KMXi9auC+LPZR0S+vgsJLp+jobPVLWKfcMRCk8M?=
 =?us-ascii?Q?P4d+Lquqo0KsMYLoz0wsNC/+/LpmX2ju8Z+AVC9PbGIIXsKI5Kli//F9xQXF?=
 =?us-ascii?Q?WgLs+XNoIN4zbwTI/VVsI2CNn/aJlG+3cAf1y9n0XqI1xIZK4SdxDu2uvoRm?=
 =?us-ascii?Q?fiTWvFnN+wBZCplAiS3m2VrMunnT61VRMhR5xuYDK7ZnaByU3ukXmz69d6Mh?=
 =?us-ascii?Q?8ETemBNksApQxoIO4daVLo6hRrSkNbcm7xdn3btxGaE0YJTK8zchFv0X4K3d?=
 =?us-ascii?Q?C203L8+GzSvIkKa4heM2ByrN5oI3KGvv6ob0bZq+ZOCLJKXSlbGtdc2mjF9k?=
 =?us-ascii?Q?zWFnXqtW64OFR+YNJSq+Z17kpuvZ1Vba/LQRprXZhDWndxpyCvaNndoOabwJ?=
 =?us-ascii?Q?pUzoyXEpF1oCoNHiQI9FquIhW1FfupHWEYRjlEuxyHcEgxUn+yy7LAzc9Im0?=
 =?us-ascii?Q?IJW7zQ4tDThbQW0ZX2QrGMP+w8XRuc8Jv9tpuLtA7xAVzqqp4YiMfCvM3eSX?=
 =?us-ascii?Q?8YB+9QhYm/+rnxAKSqb0N/BTYiRz/C2oMHA9gOfyiqOIf+G5gd3dOi475TNw?=
 =?us-ascii?Q?zx+QiUbKF+2IjnRx3ko/TftqKij6eA+LxWGSmzneOBt5AJj8gk6E41IH7aSM?=
 =?us-ascii?Q?cbBru0ZBxU/WI7htzt6ON1OD+Zfgb6u6K3olHS7sdpBR6UkdW41sq3H6eDsa?=
 =?us-ascii?Q?sYYoKDMtvh1dsbvrbkRiCJ7jATcst8LPMEZolG1ijAAIE0zPNyFjszx86Pvf?=
 =?us-ascii?Q?BW8Z13tBwwTZGXWP+MzCdnwk23WIVURgfyLcMScOBdJNoMHW1QfZaHyaM0VK?=
 =?us-ascii?Q?Xi2l5lxjxR41D3H/NHlhtj8zlClwPhXT7CYddxHbWKKCj940zpZZQunNBWXv?=
 =?us-ascii?Q?XQphDPEAHMVLPcsQWWon890rkdVMg0Ge7xXzbcQDtY8Qkj1fE+UfhQ3P4PzE?=
 =?us-ascii?Q?Ib+RBVYDW8zyl+/tCJ/SasF7TO1zH+8FUTqnb95gMabisZThqlHj1+SiYkMk?=
 =?us-ascii?Q?R9+KL+P7YJWWjrj7H7FeMQE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 494d82db-5a47-44bf-116e-08d9aff941e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 09:52:13.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gxg8NYFrS4Jhsa7N4n0+mWaWc+0Qc9NSJqP4rWR3BhPPHs/mto6zSOrTfLwcNX2hogo8cNe6I0CV9T2izwdKWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 25.11.2021 10:24, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 25, 2021 at 09:57:31AM +0100, Jan Beulich wrote:
>> On 24.11.2021 22:11, Andrew Cooper wrote:
>>> OSSTest has identified a 3rd regression caused by this change.  Migrati=
on
>>> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4=
133)
>>> fails with:
>>>
>>>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf fffffff=
f, msr ffffffff (22 =3D Invalid argument): Internal error
>>>   xc: error: Restore failed (22 =3D Invalid argument): Internal error
>>>
>>> which is a safety check to prevent resuming the guest when the CPUID da=
ta has
>>> been truncated.  The problem is caused by shrinking of the max policies=
, which
>>> is an ABI that needs handling compatibly between different versions of =
Xen.
>>
>> Would you mind pointing me to the flight which has hit this problem? I
>> don't think I've seen any respective failure. I also don't think I've
>> seen any respective discussion on irc, so I really wonder where all
>> this is coming from all of the sudden. It's not like the change in
>> question would have gone in just yesterday.
>=20
> It's from a pair of newish boxes that Credativ and Ian where
> attempting to commission yesterday. Since the boxes are not yet in
> production Ian wasn't sure if the issue could be on the testing or
> hardware side, so emailed the details in private for us to provide
> some feedback on the issue. The error is at:
>=20
> http://logs.test-lab.xenproject.org/osstest/logs/166296/test-amd64-amd64-=
migrupgrade/info.html

I see. Quite lucky timing then.

>>> Furthermore, shrinking of the default policies also breaks things in so=
me
>>> cases, because certain cpuid=3D settings in a VM config file which used=
 to have
>>> an effect will now be silently discarded.
>>
>> I'm afraid I don't see what you're talking about here. Could you give
>> an example? Is this about features the flags of which live in the
>> higher leaves, which would have got stripped from the default policies?
>> Which would mean the stripping really should happen on the max policies
>> only (where it may not have much of an effect).
>=20
> I think there are two separate issues, which I tried to clarify in my
> reply to this same patch.
>=20
> Options set using cpuid=3D with xl could now be rejected when in
> previous versions they were accepted just fine. That's because the
> shrinking to the policies can now cause find_leaf calls in
> xc_cpuid_xend_policy to fail, and thus the whole operation would
> fail.

Okay, this could be addressed by merely dropping the calls from
calculate_{pv,hvm}_def_policy(). Thinking about it, I can surely
agree they shouldn't have been put there in the first place.
Which would be quite the opposite of your initial proposal, where
you did drop them from calculate_{pv,hvm}_max_policy(). A guest
migrating in with a larger max leaf value should merely have that
max leaf value retained, but that ought to be possible without
dropping the shrinking from calculate_{pv,hvm}_max_policy(). Even
leaving aside migration, I guess an explicit request for a large
max leaf value should be honored; those possibly many trailing
leaves then would simply all be blank.

> There's another likely error that only affects callers of
> xc_cpuid_apply_policy that pass a featureset (so not the upstream
> toolstack), where some leaves of the featureset could now be ignored
> by the guest if the max leaves value doesn't cover them anymore. Note
> this was already an issue even before 540d911c2813, as applying the
> featureset doesn't check that the set feature leaves are below the max
> leaf.

If this was an issue before the commit to be reverted, I take it
the revert isn't going to help it? In which case this information
is interesting, but not applicable as justification for the
revert?

Jan


