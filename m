Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F9E434987
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 12:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213838.372189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md9Hh-0000kU-2Y; Wed, 20 Oct 2021 10:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213838.372189; Wed, 20 Oct 2021 10:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md9Hg-0000iS-UN; Wed, 20 Oct 2021 10:57:24 +0000
Received: by outflank-mailman (input) for mailman id 213838;
 Wed, 20 Oct 2021 10:57:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1md9Hf-0000iM-49
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:57:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f095c44-3194-11ec-8342-12813bfff9fa;
 Wed, 20 Oct 2021 10:57:20 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-PiSeQvcTN2C-AsAzAAkxMg-1;
 Wed, 20 Oct 2021 12:57:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 10:57:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 10:57:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0015.eurprd03.prod.outlook.com (2603:10a6:206:14::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 20 Oct 2021 10:57:13 +0000
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
X-Inumbo-ID: 7f095c44-3194-11ec-8342-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634727439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/eAlKevja/dq212jGYbDBU3v+bl+jBCSCxsJvbR48Y=;
	b=fptdG82or3DsJYyi4keP0NjeTQk7P7bnkPQPxS6Xnx6PVPtGdi+Kmo74wU/yyAiR9wtJmC
	KQ0RwQp6U/QzMXaah42jm/mfti5wkn5pk3XMHVNjVBq6HpzLaaGBgfOX9cEYZliI7zGQFx
	IldGv4lixY4mth2URRTXIP1krBXhS28=
X-MC-Unique: PiSeQvcTN2C-AsAzAAkxMg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/ZNZIAIq0q4gusYtACsVdF8GA12pvi8uYe1Jsdu8ULUWDnn7UghnIqzb8Om1YoUz4rMtzWHYITurNaJ9NO7G6VCPNaNYN7cq4gk/QxFBcIBflUQnbjE9Bmevy6aqTsWvpna2snk/6bALDqMMScxm50RfwpiM8H/LbBC7u6zJLcMC6ibXm2o64vA9xEltwAZ57+oQ61eR60Qzdd6umCoUN1k/HmpivD8ym75YgQcl26x/dk5B6l/ie+vip1XaZYaZZ+GjmB5rZdGiXMdzB8lIIPaLa7yjIH9Nxh81KVjEQVqhzRN51j4vQHvVgNcSln54Ii9lbwA500Y4la3BDS1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iESsk5QfGKCSNYoDRYowdJX3usymRyJH1qOJEoXvZcs=;
 b=Z230Dykb4OK8IIrMJ3rWqUk1WQdbPQpUojbAy+28ysRdWDpj0qLNCD7A9JlxqNbQruoKXJBhYEYMlHJznmqRthHv3npNEBWnAsmcWukeniNFhckblnhmSeW08ylj/EWiFHL32pULdI8TIJcPCt1XhdYnnOpNMsuqg93YHK4X+qKvL88kmmRJEGB5VWpRUSMfGDy7sgyga4Nu/vTaeG1Dgp3tlqp/86spodsXy0G/4pDFNNUSHxSfICeLLI+s6L350Jdr84F/peokHUPO2XP7DOg7kzb4uKGVD///RyS+kF1scORtSIbwLYKS5Yv6ztGdEpUtyhzWWAc4p/BC/Cmevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 2/6] gnttab: allow setting max version per-domain
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-3-roger.pau@citrix.com>
 <f5564634-5f9e-0b94-f73a-d44ae65c30f4@suse.com>
 <0b58667f-b6bc-d5b5-2dd1-0c8996367319@suse.com>
 <YW/NipJMLH0Zz05s@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3d9388a-e2f5-76aa-d51a-2d74afb92bbd@suse.com>
Date: Wed, 20 Oct 2021 12:57:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW/NipJMLH0Zz05s@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0015.eurprd03.prod.outlook.com
 (2603:10a6:206:14::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eb185d9-5180-45d5-919a-08d993b85fe7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB419217B433F636411F49F08BB3BE9@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mkuqyGQ0ZdjNRBj+92YKzwUac6usUj9b88sub6GM9NrJlZSZisDo6/YNgLUDvQAv4iSTSZvznNVyi4X7cjl2LIefmq0uoE1AQ8SmvSiTW4ChI+bqWSydDw2N8JtSjj0/ZJQ/13af9CrxVEuUBBS66gpXKV//CyH3Mht7MxcE4uhoCpbTuDEPjto3s+jkBGYyXCEvd8aoicrtWqY1U5d0bzSbBpYfN2OhoYnsdFK1ZpYFfzpfVMbjawCo2L2Is/VgByI6Bd8L9iT1BCpAe22n2HA6JYFsC+AIutN/VNxoQIQQg+JQ6/sFwxXXHe6iQAbqvkOjLpadVwVx2tntBYJGFaXMIQ1p9I4uL8Pyu/2H0GA1OuGumCtNzV79bskvaylLqonldmpzJ8iH6EhMV8UpUzqwgJroMvEVONF//6H0DQY7Kh2p5DIfYgMmzkLtbYjtCmYHFL2jrG4J0W3yCADMZepSgcJkwIIRUY8G1xDGCJQ3KXS3EqWrqNGf5rBPLBKDqtqNbwKw8SwXSX9MgrDsq+pgtEpnngX9ZoOfbeI84cmQmGBvGLF+LGd45TuxYQ1zH2gQz6+rkqUU8zRaAj9qCxT4Bc4+WD16+4Not62De3NE1OEpp581VADBED1G5rF4e4IapFacT7KoH2/5T0rfwCl0fxDb4y6ggvGQmHZvzZrhDL9biR/tIuT05hMj/1Hi0LQwWWm8LIt7ICalIdqE/uVaK1TyXjz+dcfRj1DRkuODhcCst0RzbxMkQNX4dAd9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(6486002)(2616005)(956004)(36756003)(38100700002)(8676002)(31686004)(5660300002)(508600001)(26005)(8936002)(6916009)(53546011)(86362001)(31696002)(83380400001)(7416002)(4326008)(186003)(66556008)(66476007)(316002)(54906003)(2906002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?em2mPbYGRl/873zLgAhCYRUV7z9VScvS8K2Ib9fOg4XhvEZod8gcB/DA9YcM?=
 =?us-ascii?Q?BBf2nl/Kd0rt28Vz2SRl3Y0yFhEqHEa174fNl3W2FKH1uKXP0FURizIp23Em?=
 =?us-ascii?Q?v7LGE9TeeWX7Ydn5+aZYQ12aeyxDw7RcfrsjyhPvQuHmUv7ThTlhvy8vmwAn?=
 =?us-ascii?Q?BUs0pPeSaFz1MrDR2tKD57TIyQOsnjz9LMOvh4MdKE5j8/OM36NMDil7tq0f?=
 =?us-ascii?Q?6bqI2Kqg8qF293cvzLIuYKD0mhtkefMJDOWmSN4MV6MwhblQOp7UEssFvMbn?=
 =?us-ascii?Q?M4fkuiF2nWp1qn51h75knk+F/lqZ3+ipWpmn40oo/EXp+Ol0Yz8FGXRIhI/S?=
 =?us-ascii?Q?8mwfyNWn84/Mie+pwm5zaYtGZ2b1jFn63jzCEhHmTLXcRDVsooLPNyXs8xcl?=
 =?us-ascii?Q?uEF0p8J2vdcSLK1BEnFYL8acz0EHDj7soPBszxcs+tFkARrIu509nXysQDc/?=
 =?us-ascii?Q?b+J+DcggTQMD+PUmYKk2da7S/ctzq0T/J7zw3R/9xKOmKBbJwjmtmh/ILotk?=
 =?us-ascii?Q?M0Uy6VkmtpUWy79TojjwtE48PAOcUCKODEd2OMA8wZY/h0hGpKJyE5kuHSA4?=
 =?us-ascii?Q?mZS1toTsR+4SXvAhP/qQlBKf7e0Y2G9X6qmOMxAA/VkBjCubPqaxxFYNR/u3?=
 =?us-ascii?Q?WPDTa809sb/ndYh850k07H4lvK0vOqbznRaY7okJfOrtRFmhihZDEGxbBQ2e?=
 =?us-ascii?Q?G+RMY3v7xqof4SJ/Xkf9LyOn6kJoFWCaAFWzeOnSzA+OgibVu0vwcBMD5WLu?=
 =?us-ascii?Q?iK1tK2Y3blcdjHzwZyZr+/QtgOe4rJE5zruCtexeQ7sh/+sJzz5rKC9A40BC?=
 =?us-ascii?Q?ZIcyw8K5+f+lbb6sF4sYEcUP6qnOUOsfEcLkClK/4T3uBhZ+pE/7Q3DYVZ8M?=
 =?us-ascii?Q?LM2bOgovQfA+JNRQ54ApvBROX71qc04HQEAgdowIO4xMeXcyOdIE2mFoouot?=
 =?us-ascii?Q?EbBu1HGU1FNTscHTLVzgBWia+938ehef9FSzlkj+nxUnSB44+mhUsSGeIs84?=
 =?us-ascii?Q?76wQFq43C5rKycHLa2qT9Oq8XeRQBsBV0MDHRldL6OetUUJCRr8aqkdE+Yqr?=
 =?us-ascii?Q?rLVYEfiquZ88uSOO1dQVnQgKLEViaNBN0nisoFVKLv4VAnVX6eWBZVkB4Pc3?=
 =?us-ascii?Q?/WZdtdeegHbHAjyBIWgDvih0hqopUBRHedijCZMIU+X6XdcAopuBVbcItzs/?=
 =?us-ascii?Q?JMhVrFbsQxmp4P0mEOU7MVhSN9RHXi6xWEccEFD+JvUHFBI1DZHg2/evEFYF?=
 =?us-ascii?Q?SmSzZEH5QX8yeMfVZYaKcqtWG/T6FDV/+C/8QbZ7mPohzaOTi7vpEysehbQP?=
 =?us-ascii?Q?Iu5Y56b8KDnF45Hv5CQvqQI+QHVRSBIltQNj+bdQc46u7olHWgBNnhyZ8sGy?=
 =?us-ascii?Q?poTdiAwL+f/xGizbLEuJCpSdgL7Z1Ka6HMkpp5zvUacjmUwleEP8IXXWQW+7?=
 =?us-ascii?Q?ia0cQN08H+8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb185d9-5180-45d5-919a-08d993b85fe7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 10:57:14.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

On 20.10.2021 10:04, Roger Pau Monn=C3=A9 wrote:
> On Fri, Oct 15, 2021 at 11:48:33AM +0200, Jan Beulich wrote:
>> On 15.10.2021 11:39, Jan Beulich wrote:
>>> On 22.09.2021 10:21, Roger Pau Monne wrote:
>>>> --- a/xen/include/public/domctl.h
>>>> +++ b/xen/include/public/domctl.h
>>>> @@ -87,14 +87,22 @@ struct xen_domctl_createdomain {
>>>>      /*
>>>>       * Various domain limits, which impact the quantity of resources
>>>>       * (global mapping space, xenheap, etc) a guest may consume.  For
>>>> -     * max_grant_frames and max_maptrack_frames, < 0 means "use the
>>>> -     * default maximum value in the hypervisor".
>>>> +     * max_grant_frames, max_maptrack_frames and max_gnttab_version <=
 0
>>>> +     * means "use the default maximum value in the hypervisor".
>>>>       */
>>>>      uint32_t max_vcpus;
>>>>      uint32_t max_evtchn_port;
>>>>      int32_t max_grant_frames;
>>>>      int32_t max_maptrack_frames;
>>>> =20
>>>> +/* Grant version, use low 4 bits. */
>>>> +#define XEN_DOMCTL_GRANT_version_mask    0xf
>>>> +#define XEN_DOMCTL_GRANT_version_default 0xf
>>>> +
>>>> +#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
>>>> +
>>>> +    uint32_t grant_opts;
>>>
>>> As it now seems unlikely that this will make 4.16, please don't forget
>>> to bump the interface version for 4.17. With that and preferably with
>>> the nit above addressed, hypervisor parts:
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Actually no, I'm afraid there is an issue with migration: If the tool
>> stack remembers the "use default" setting and hands this to the new
>> host, that host's default may be different from the source host's. It
>> is the effective max-version that needs passing on in this case, which
>> in turn requires a means to obtain the value.
>=20
> Hm, my thinking was that the admin (or a higer level orchestration
> tool) would already have performed the necessary adjustments to assert
> the environments are compatible.

I don't think we can rely on this in the hypervisor. We may take this
as a prereq for proper working, but I think we ought to detect
violations and report errors in such a case.

> This problem already exist today where you can migrate a VM from a
> host having the max default grant version to one having
> gnttab=3Dmax-ver:1 without complains.

Are you sure about "without complaints"? What would a guest do if it
expects to be able to use v2, since it was able to on the prior host?

> Note that adding such a check would then effectively prevent us from
> lowering the default max grant version, as any incoming migration from
> a previous hypervisor using the default parameters would be rejected.

Right, guests would need booting anew on a such restricted host.

Jan


