Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477C04B22A1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 10:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270264.464491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIShy-0002E0-RH; Fri, 11 Feb 2022 09:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270264.464491; Fri, 11 Feb 2022 09:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIShy-0002BR-Nt; Fri, 11 Feb 2022 09:59:18 +0000
Received: by outflank-mailman (input) for mailman id 270264;
 Fri, 11 Feb 2022 09:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jrYj=S2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nIShx-0002BL-Ls
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 09:59:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 459de98a-8b21-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 10:59:16 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-MF_YvvIFPhONmmX_GOAhZQ-1; Fri, 11 Feb 2022 10:59:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4215.eurprd04.prod.outlook.com (2603:10a6:209:4f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 11 Feb
 2022 09:59:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 09:59:12 +0000
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
X-Inumbo-ID: 459de98a-8b21-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644573555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rvPjWIXJX3c14Akzkvm/COtfz4A1SfrfTWH7Z2dgZg=;
	b=j6aBWmbxCmhzOFIwOFR8joeO54JEby3QFKMVVuBppy3BrEFpFje0doMJ72SNFZ7v1mZtup
	3rWklToAR684Ma2L8XvSQ4uvuwydoGUM+fzPomUdCrKekjFtqkUd4UfX00eP/wKVGsA97a
	ehHfHf70Nlb8Q/baWkvV4hNBzXWuw0c=
X-MC-Unique: MF_YvvIFPhONmmX_GOAhZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KP3j8anBK9qfxSdLgKjUf6sCByonlvayZyGhSaGxKeqQOuDC+RfxVqqFcvmhS+5yJrkvTMeo1enf7/kzSdukoAIWmXCvfA86nBGFtoPNjeSJKHMRrjZcCtfqTvCWhz/UF2r2pgd8UxGe5hG0Z/H4Qjnrm0DdPf1IsdCK6OjFayXuhbdkd8zTTJ0IIhbixQCcsFE7f8qK9UA6dyimTfkuA8ts92dgXpI8jj3guU95lRPVEpnBmChcGvbhCBkGm5SKw7UlL+NpGOqwHxepZy2QN2kS0vCwIZvk6motT8+1avLzw5t1LLBoMgnbEC66nNSgRl4fbClxAdyBNo29PSQspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWKHPpJzzG3FUFJYm97r50yYyjzyjcEYUYdLV4MCfRw=;
 b=YJD2HTFTkWIgjqKdOQSDCg3gJTQVwye9xlpvEkGOxOt4ZxcrMnDI8NvTvMrBXMxjEeE6FTb/D3joVDkMbPQv6F4dzeH5sqHnLyUmKWdvQ5ff0mwT6FNHHjgKOCePj0DiE3gSiXFwjOdRNFKBeiMxL/FOAvY70MiSItpyeqtWnyoF5BAz8xWIc/Mhva2t1Pp0RZBXJHH7wPNrcpEX16CgNlDnVhBBsROrC2SMxFNK+agPjsf2moHVn3PUBBkLJFIsU6wUnLBhJsVnt4rnLKr6yJFeMrAmHbXMz4QXNWBLtUXX4L9cZcw9845ibIxxZOccqPy0PWH2XRkjqMCR7Ud08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b751bc52-7878-e1dc-9769-55328ef1abf7@suse.com>
Date: Fri, 11 Feb 2022 10:59:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/3] x86/Intel: skip PLATFORM_INFO reads on family 0xf
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
 <6f56a75c-cd68-0dad-b1ef-a3421271ee47@suse.com>
 <YgYu+OoAovYmTg8E@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgYu+OoAovYmTg8E@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cb59ab6-96c0-4f2e-b5c9-08d9ed4527c5
X-MS-TrafficTypeDiagnostic: AM6PR04MB4215:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB42153DAB4E7F17E4C47F3B27B3309@AM6PR04MB4215.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I0Y6Juu5J3z6tn3lRE60BQ+7IyYID0JWnPjd8B04sHbPwLWyYOAuW7cv5ycGWIL6PIeWkBOIWtlzLi1/tgOn0NEGz8qEU9FFSgJUAWCyp4ONONwxrNRgi9Ih6nINmXH0OfMUMdcILV2NyewrLcnnORvk8stEtlLSHsBHzpMaLCw1UUPhwai6baLE7S1w358FN0epYhRLRu5VO5dG3r3SxOypLwbl/loLnEKmjxRLJ6CLU1XvEpRfq2R2T27stpL+Ix1Fkhk/i4imhZjkcER/m7NepDvNlsK3zk7RH3Yjwtv9spOMnwI6bS0rBUZCagaCuBhFcJWUk4d0yhqMRVsrsZREZ8lkfWfuJ2o9qfWoGrkvnpABz7pLVKwH8w3frGiys+hmTBZJXAXPsXTr6rWyLYvYqQPRvPn1MoLMhiWU0BaIO4vqzNDhT+V9TCUzoocpuoaJZfxDv4B01yJFTZ6duqqMDi0G4tHARLEcfcLe2ivgGdclW2CKtiBXs01ygHtrkabVDBXr2QLdtIh5uSdzZbt9H2n/RqtQlKNME7i3QmbjtQhavLK9a08Lp5CtdfoOI28CPJzue6hSxXxNOeyJMR0s/2bXaQPCHBN5BsFDu+/7TL+muh0u0WjKoFmG38wuC/r/EWQJ5p82NtfehJUffe00DYJiXI+8j2yJE6cAtVcheom/RVN+YAPImHpb6CebreMYOMjEGdTTgXDypioW9gerWWVRho0aeLNzQlycbTzBHaW6UPb8zmNh7P5kXgYx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6486002)(38100700002)(508600001)(83380400001)(6512007)(26005)(186003)(2616005)(2906002)(6506007)(86362001)(4326008)(53546011)(8676002)(8936002)(31696002)(54906003)(31686004)(66476007)(66556008)(66946007)(36756003)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vb/vW6FwHjKe5jYI34FN95cRLVGpmNhAHKqvZcSII5ISaAvmopIS3dA826fR?=
 =?us-ascii?Q?TMtk68n0J9fa8ECPsi7H2yVS3Le3DAY96W2a+tokzYEn15gSTNAYO3VzAOUF?=
 =?us-ascii?Q?JREowvJx3fh+YxUffRieYi42Jngyt+qfaqYbzmPErcHXaDgn+33lTmD/h0gg?=
 =?us-ascii?Q?cLI3muq4l6LQA8Jb3PNIU6ksWtG6plTmy/bidX35XI5H7tO0V+yuTq1OuXdt?=
 =?us-ascii?Q?pH6iu0fwkoRJxxgBvNCux7LtrMG1zkPce7R8hLS6tLdJkUkdBaI785aG+60n?=
 =?us-ascii?Q?1GhXGqFFAtR1PnkIvha2v/JabhUSZPejHzWU3NExmP+cHHZZlY5re9O2FdWF?=
 =?us-ascii?Q?d5+owE0vWsZsSKOpqCyLc0d0l+L4ud+bjgrWQPsc4rzaUi4wESTVLWHVC5dv?=
 =?us-ascii?Q?71uVQlsjLaoSTYDyZdrSSwsNtkvWI+1GjyH6lscBillOQSTdKZBv5OpSlJ1G?=
 =?us-ascii?Q?PPzrpBcQkH3yo0TR7hxWeS3S7jUoyowMAOOAPN/EEB5VRBL+lnjF1nC7nh41?=
 =?us-ascii?Q?56WY1BjpAx99epfmiRCa0P2MDwtTBItOR5V499HtBLnYLHgm+sK/1baW3Q3a?=
 =?us-ascii?Q?N2VSR02cf1DKUEjO/i+df16xA0ALNrxKJqiJS2ukt2xnr5hZ0pc3V1SF9eEW?=
 =?us-ascii?Q?nL2G4oKBbUyzDow3YxeAxOxvzeIM/FLq/q77VbbyshXJfk+0SNPRzs1RhS0j?=
 =?us-ascii?Q?coeUCb4sYPD9Q/gkzJgMT2k7fKffV1j/wCA3PjceWvtfVPQEeIcX+Q+IHJ/Q?=
 =?us-ascii?Q?oxgUKp2KQ6veaVYRkStcqbQ7fB0/EG+FmInAsbaUbJGZ5zXqhDtAcbMT1+ig?=
 =?us-ascii?Q?iPM1EZl2jIw/5MeVE5MbiOe+LKYAl1aAGHJQ+NROXgBOufvSUORdhi59hFdm?=
 =?us-ascii?Q?jIUbgLn3togBDYmkmlqyyqITE7BRUH0x+Ea/yhiJEsVbq34z2WaPO796+IVE?=
 =?us-ascii?Q?uUozVhypQx2Zxt8ScSEXkW9uHKCwdECu+usUPQwYoT3dATpDHbdm/ULvWbgA?=
 =?us-ascii?Q?j49JO9nGtrSA8PSPjlNQL1gpLpYTAeTHO0qKYDG0HHw6f9k2rOMFQMYGViJr?=
 =?us-ascii?Q?80Z8SN7B8Updt/3pMAAZAhQss0UFIJK44ZfPi9mupDVzIIrPRhMIFVY0pP3Z?=
 =?us-ascii?Q?UXFpQToq8mQilvnt2MG+acJ/41iP1NWI9Wm5qpSRhCaTBtKnb2t9xDQSDZ20?=
 =?us-ascii?Q?vkzN3nHDoTScTswjyXj96c1gPPY0PvN8WI1pYUJCDksoe6NLDX3GIBhOgASN?=
 =?us-ascii?Q?UfL05FSe00PvUn1F10yZtX1G44YWQr19fuhRRXSJGLgCkpXSVUMtevdz/cCI?=
 =?us-ascii?Q?AoSO9fzw2IlSAzjGpoxY/ca/aoRLrWSDVZXoINb4JHkHc//7sS/UcNrHzYxf?=
 =?us-ascii?Q?Odfj2b3uFPeKZFRaAadtHuuwWf82XHGtwVP1VxaqDgXc5858D3apsrVvOriZ?=
 =?us-ascii?Q?/2I3S9jyqvg/ZZOD2HV9pk3obgJ1iPfIMqbFEfRKEnG8MtoHarhidVKJ9bH8?=
 =?us-ascii?Q?ZWKR5ATAt3EpXqjHjA6QlFuogBv9c6BI6DF7Px18Xqk93WXRrV4t8QFPcHmW?=
 =?us-ascii?Q?rnzvshcF2kxbJRseWm5ATYNdQoa/CYF4wG4ZWFdNXuJupoa2JKmDZNPnTGHC?=
 =?us-ascii?Q?5uR+xQo+aBY/sGzYMdVJulA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb59ab6-96c0-4f2e-b5c9-08d9ed4527c5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 09:59:12.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwigN42W7vFfx8HxWpQ0Y1k7WFJqLV6RKSJpbdi+7m/nflf203LEyJ4JmD1pN1sPrYxo1UD4miCILzWcFaAKgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4215

On 11.02.2022 10:40, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 10, 2022 at 03:55:52PM +0100, Jan Beulich wrote:
>> This avoids unnecessary (and always somewhat scary) log messages for the
>> recovered from #GP(0).
>=20
> Could we maybe get rid of the #GP messages for cases like this where we
> are explicitly probing for MSR presence? (ie: it's expected that we
> can get a #GP)

This would mean some form of annotation of such RDMSR attempts (for
the recovery code to recognize in order to skip the printk()). Not
all rdmsr_safe() uses are, strictly speaking, probes, so I wouldn't
want to put such in rdmsr_safe() itself.

In any event - quite a bit more work. Plus I'm not convinced it's a
good idea to suppress any such log messages.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Perhaps even use "!=3D 6" in at least the CPUID-faulting family check?
>=20
> Likely, or else you would also need to check for family 11 (Knights
> Corner?) which doesn't seem to support PLATFORM_INFO either.

I don't think Xen is able to run on these (likewise for IA64, which
iirc were surfacing as x86 model 7)? These are the co-processor ones,
aren't they? My question was more towards whether we would (wrongly)
exclude future processors when using !=3D 6, if Intel decided to ever
make new CPUs with a family other than 6.

Jan


