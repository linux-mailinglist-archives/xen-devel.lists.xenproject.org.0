Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC343F0328
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 14:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168214.307114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKHT-0000v1-T0; Wed, 18 Aug 2021 12:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168214.307114; Wed, 18 Aug 2021 12:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKHT-0000so-PQ; Wed, 18 Aug 2021 12:02:51 +0000
Received: by outflank-mailman (input) for mailman id 168214;
 Wed, 18 Aug 2021 12:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGKHT-0000si-3o
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 12:02:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 347a197f-001c-11ec-a548-12813bfff9fa;
 Wed, 18 Aug 2021 12:02:49 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-_k7dPkTxMIymdN_tXuI3JA-1; Wed, 18 Aug 2021 14:02:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 18 Aug
 2021 12:02:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 12:02:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0244.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 12:02:45 +0000
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
X-Inumbo-ID: 347a197f-001c-11ec-a548-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629288168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWYKZarjBM8MsRFISt8BAXwcJhhwlNXkEM9kNb5lI58=;
	b=VvvLfZ9e1mGg/7hyfBWX0Z2zHfrcT+7Fveqpid8xs10dxQiznIoiAsVI6h0O4JfW8mwC+R
	BzQ8/xoZfFQSvrlkeNHFTGvR2CYxK//J2hHm9c0XRj6bSr17QCFMjkCJeMba5R04njswco
	l2+ijbZBHmv1nfKVxOMpMQPA1HM2Ycg=
X-MC-Unique: _k7dPkTxMIymdN_tXuI3JA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Liwf0CQzohgP7n5hu1Njfp+b4uppAlGQxRn73m+2ZrlkUcCWzt0El5yJX6eaV9dmYfpyIMU8LFS29kou5r0QpgYACt1++FsE4rli1XE8n+LJ1669b2ui6DLIhKTQeK+I5V8fCIFmO6HfW8cVAqptR0xyk+mtPefhuHeD8vGuj5mfyjTQKuE/mooOXqlIl50zZrbt+OxmZbxjkvOQBqrDCeWAByZIwnm+j8JfyXOh85s3Wbdc0NSWEkXdUBE7U1Rlu2vaW8CcJvE5ncxJze+PX83JNSPUHL3EOhpOFV3HDqRUWExJC/+gVzR6VD0CVOo8JjnZQ34jcdyyaC3TADpBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaF4+4uygjMfOWH5UZKPDItCFvCiNzrP3PQhde84PV8=;
 b=IcqcKGaiHaCL57eCF1tdyh+t5UtEG2xylTpmsh1bOb/715gUlnNDyfvKvv0E+FtWCHEtUg0aVrVZaXdbis/f8+hx6itQKyEvFyoQC0i4lqfT497/Rs+dqRlMmijeSnMqlymbF5mQmZ0T5F4jOu3gMVhXNQWstbU2Kz+6iVejajaHMf6P08hOoZ0XWcgn8ITjecYgWtbcCfs5NhPFLQ7mZ2udAVapElMdBKXn+tOWGK6lXJoR4awkHEbgyBqGr3V81qQmtX87wwLUzzdraRcaIGmzVF6kyrSOODsSObzaEYEhB5ezydCPG9GrCNBhLjgiBWbZUGbmzryyFBfzUVbquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
 <8a2edae0-bf00-a8fc-51a1-689cfd04e08a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b4af46a-ae32-9dd3-f5c1-836bb2675470@suse.com>
Date: Wed, 18 Aug 2021 14:02:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <8a2edae0-bf00-a8fc-51a1-689cfd04e08a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0244.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::16)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 265883f1-c3ec-4c26-3ac3-08d96240172e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472838897C0B6DBE5DA85D2B3FF9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lwr/UUoBoZhcskNe3eHDapHK40k1rFG6Sb4w5TkDAuw3PqTKdnOZ54bo/E31CVtXeGNosg2OByLqUnZLkkTJt8Q1XlFujOGmkFC9GcanP5nH5IW1/UlWO/dl0glMK6jh5KdhiUosdnmm4RO9eThevUIWIUAz0z/y1N+7fERi1/iiqclrBD0vD3pXSwYW41TG3FsWo6uOcGg4CE3kOS0kD9tbc72u56TlatXdzQPe+BJUJ/ByTbMo4ruYFe/303vno50FBAnhRsG8eh5ny5bWq6ODRJVzAlvEny3GNmAAC2Wk3SAeZAW+4qkoy1sUkxPMQmwhL6XXC1ww4Npig1X6hhiz/6j9T0FJSlQUsNXv7XkJASo8VA1/kEiZW+1+hDayCVnB5YjYzGwMa/6MRlqM/xoKJqCrEZyT8/SE6fF0qCjksgxb+UPf1Dujp0DoSEKAwWCB0xTr91u1Df9x1wlpdPXG1+xvEbQP1HVlimvlG/4O87l4kNIK81Or0rKeb4bNw1UsniCf/uH2lm4P8vkaYCmLsemk/YcETCeKkLIMGaUCKy3WC2WWvryopTB8AeaTXgalyT94E1Zh6r0aaOp0euvqtPD3B9wT4Eu4WKVCCMb/T8vtaooHxwHPTGXsdzzMhTS8YoFj30V1D/2wkYn/lP2Sq3nG0d77RGJgcuFDh6jWgjWv5wzSplC045IGbUYbJuxJDL7sNFWcOPdSheDp4qV7G06u1SfgC9Ih0znnVf4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(376002)(346002)(396003)(66946007)(316002)(186003)(66476007)(26005)(36756003)(4326008)(478600001)(16576012)(38100700002)(66556008)(2906002)(66574015)(54906003)(6486002)(86362001)(31686004)(83380400001)(6916009)(31696002)(8676002)(53546011)(2616005)(956004)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LBuPy23+UlDOOICKSlOaT/tjQATHzk1hCKvHYx/tGm6+ksAruuVnlh8BHXhw?=
 =?us-ascii?Q?wGPsUpmT1uufLUnQRt8r7bKxiDtXfXnLIHIICLaLOtrnge9Ml21efhK7wkNT?=
 =?us-ascii?Q?VmACRyW9bd80RqNVyqRE9J5m0Dd61kkgksn2rjd7pBWh++DCB4ue68Ta809J?=
 =?us-ascii?Q?cVmMfYrRBKaI0yXP6FqRbhgCIVL7i7Ygp9XyTTbi49imuy8rx1tk6eIDUxN6?=
 =?us-ascii?Q?XN0D2ZGZUEK2QqvQ63WpgWOK/cojQ+a3+IDqAPTtw1ZVWk3cg6m9AeOTU4O8?=
 =?us-ascii?Q?UfFwulolnX1zZdsABwBjX0lsSe+D66TaFwvwtfFbUjUFEXBNj8O+w0ceY6Uh?=
 =?us-ascii?Q?Xjmy+FIZ2op7vJiqH4s3EAXcAK52SoU88l0KQzylNuBZCgUlQJQYDxfUzWSd?=
 =?us-ascii?Q?3C6Ilygby58BNv8N8QfvCnvk7BxYdNC7lDIXvBcAd3I3MQvv4K2CR9GDaTZ6?=
 =?us-ascii?Q?3nByXVuXETMhtombSuqSD9HLlkiVkPSCp6Z3iWKzfAEZyw54+Zzt+QW3gzCJ?=
 =?us-ascii?Q?IMoWBrcItnEPprcP+WAPYsm+X+XK2o2LHBNvyengus3zG3XGGFttYonF0xVC?=
 =?us-ascii?Q?4ozX3iYReX2k71qxFdFC8ZGZL9yOqmVIXOGvG85l0t2mWdAQbt6jaMiY9IiU?=
 =?us-ascii?Q?6Z0GQr4jAQYXCJBKUQSAIBoMYBFtAKFQmf9vxB7C+/RfH4GormFZ/9AQdkeF?=
 =?us-ascii?Q?NcLLbwDKoE4/3JAZ+bI0MjhjhdjIG4Yu4k7uKH26xqRGbAk8Bl+gfUfrVCGt?=
 =?us-ascii?Q?9elGwKhkZJj2C9BW+EYiDkjFd1fUeTlF1HdQD9cNatSWRgIFp/DQCrT14kda?=
 =?us-ascii?Q?cJ9Jm5ooa2Vrr4nuEFP43RI+9u97Nzg3RmS3dMhKtRkGPi6cBIu7TL1ErLNs?=
 =?us-ascii?Q?Wc5EtkKcftPH64NtNNRpeM30VPuf30BIum+bElLuyk6k/nLQSSqusOyO7KSi?=
 =?us-ascii?Q?dESOZxZswfflhhiYTpWGLLYn0R1Rrd4sYVDkqa6zl6K4CmRsF2SxPe0ArceL?=
 =?us-ascii?Q?Pmkgg2zdWRpz50Q6AWpdcW5ysegsXKCNVd5y8Qj3gSpnCt87adBIlSR1vVeV?=
 =?us-ascii?Q?/7Nan4XKwYsBBlqkSRFFHawGVp6emgwK59ixbcE+So6zUKdes4693v7/AUXE?=
 =?us-ascii?Q?WGHcPl+lFQfOTP8M43cqokb1qayAOfl8OrCkN0AZqZzQqO7j2+uSOLPBWLWD?=
 =?us-ascii?Q?E4XEm8tKAy3wwuAqdgPG98Ap6zZPMGydThNKWBPkgJEZwTDQR7UjkgupCKwP?=
 =?us-ascii?Q?EZ+RotSHiV6s1TJjfNeIrMhjPgy21lIJn5SxVD1XhjHcj+QXzFnRKmbQRYaz?=
 =?us-ascii?Q?vGvD11NP3VrqBqmGidytmi2Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265883f1-c3ec-4c26-3ac3-08d96240172e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 12:02:45.7489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGdEgxIRBdqti1WI1jGwnIkX3IabscgRLqR13us287HMT5RoGRqLk5+V+lmZZSY3/jKNnrFiK5dugfxYvhrR0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 18.08.2021 13:32, Andrew Cooper wrote:
> On 03/08/2021 12:13, Jan Beulich wrote:
>> While for 5500 and 5520 chipsets only B3 and C2 are mentioned in the
>> spec update, X58's also mentions B2, and searching the internet suggests
>> systems with this stepping are actually in use. Even worse, for X58
>> erratum #69 is marked applicable even to C2. Split the check to cover
>> all applicable steppings and to also report applicable errata numbers in
>> the log message. The splitting requires using the DMI port instead of
>> the System Management Registers device, but that's then in line (also
>> revision checking wise) with the spec updates.
>>
>> Fixes: 6890cebc6a98 ("VT-d: deal with 5500/5520/X58 errata")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> As to disabling just interrupt remapping (as the initial version of the
>> original patch did) vs disabling the IOMMU as a whole: Using a less
>> heavy workaround would of course be desirable, but then we need to
>> ensure not to misguide the tool stack about the state of the system.
>=20
> This reasoning is buggy.
>=20
> This errata is very specifically to do with interrupt remapping only.=C2=
=A0
> Disabling the whole IOMMU in response is inappropriate.

That's your view, and I accept it as a reasonable one. I don't accept
it as being the only reasonable one though, and hence I object to you
tagging other views (here just like in various cases elsewhere) as
"buggy" (or sometimes worse).

>> It uses the PHYSCAP_directio sysctl output to determine whether PCI pass=
-
>> through can be made use of, yet that flag is driven by "iommu_enabled"
>> alone, without regard to the setting of "iommu_intremap".
>=20
> The fact that range of hardware, including Tylersburg, don't have
> interrupt remapping, and noone plumbed this nicely to the toolstack is
> suboptimal.
>=20
> But it is wholly inappropriate to punish users with Tylersburg hardware
> because you don't like the fact that the toolstack can't see when
> interrupt remapping is off.=C2=A0 The two issues are entirely orthogonal.
>=20
> Tylersburg (taking this erratum into account) works just as well as and
> securely as several previous generations of hardware, and should behave
> the same.

Should behave the same - yes. Previous generations without interrupt
remapping also shouldn't allow pass-through by default, i.e. require
admin consent to run guests in this less secure mode (except, perhaps,
for devices without interrupts, albeit I'm unaware of ways to tell).

Jan


