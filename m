Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B05391BF
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 15:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339595.564470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw1oY-0008Aj-2U; Tue, 31 May 2022 13:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339595.564470; Tue, 31 May 2022 13:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw1oX-00087i-Uk; Tue, 31 May 2022 13:21:37 +0000
Received: by outflank-mailman (input) for mailman id 339595;
 Tue, 31 May 2022 13:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nw1oW-00085J-H6
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 13:21:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97dda21f-e0e4-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 15:21:34 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-eqlT9RGtPdqClCKzNrwbdg-1; Tue, 31 May 2022 15:21:32 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9491.eurprd04.prod.outlook.com (2603:10a6:102:2c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 13:21:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 13:21:30 +0000
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
X-Inumbo-ID: 97dda21f-e0e4-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654003294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aKeLTfjmLj2HPOt3sxPPU5/SalvdxhLk9cWVAhXxD9k=;
	b=go/KICIaAvX7mO0621beJoBINJ0xkuxN2iM0dnWCjYIMIM29eTGEhJmox0pfleLAmpC4wK
	9uAD0mOjmoKN9dCKXE5r39aFTWhOcK6B7Liod75AKFarLU6vFA+hLgqNb7CAGFzf7wnarq
	7woPz+O7i0MIC53W0y+krRnH9mV+cDI=
X-MC-Unique: eqlT9RGtPdqClCKzNrwbdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/l4Lb1n/L2F+pWPzfKroTuM6J2pJjOJlH9f82/CtUhf1wGrzPpGR6WZB6YJ34sRhWJ967BT8nmL2Sm6sWYExYvgXq1WUcuPkGm1JG3PdU/9DW4WbogfX/4Q6vvbADoNxnhlzPkqjhwZmJf4DmGn+1fddY/Jo4SQC2RfSsIjhQQMo+OREJFapY0dW3aGIqYzS12u9/nGTaQyW4BqZeLvbWzMWDjtudwU2aEBl9CrKrQ8kb/Sc560zLuIrPxxGrq10o1wSK3zA10S8T02WbLK0K091jRQ3F0+m9foHRftwDpnyfTsT/DzL1r+4WJFKmz/mkkda3pzjxssgZNqfmoXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7l5gmN4fJvaF7RUFhpxP4W0t1hLpWHSY0G+tfL2gwM=;
 b=bTPwTyq0W6ulUN4LyOUnGA1lo33GCJaM/yECW5p4HhXG6+Mfl0b7ZZKS6bRZUL87diry8dCEYUSrNNnuzmx7AjCQ4H9PIgxVPRpAkN0ZiDP7fhJPmWZ1J2tTCcECT6EW++HonO7yPjsss3CvPW4h2Mwv3TEtI19XqEvf0WPPAPV26u2wtJjGnIb1gxodwhvY/550lFpWF8Xnm2I8l36LHoquITNnAnAAo7DPDWhkcQ0puleEamsrVWIrcHeMxRamp+dFYi+XfWY1Xuph80S3OvM0kzGAyvjldqgnZsWHU+elHTQAIlMyF0cr2JpdcWsK4orXL6hMnJ280x0tv4u1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6003b7a5-63c5-9bd3-03db-a4bac5ba8e00@suse.com>
Date: Tue, 31 May 2022 15:21:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
CC: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220523062525.2504290-1-wei.chen@arm.com>
 <20220523062525.2504290-8-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220523062525.2504290-8-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0028.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b6caf7c-9ee8-41c1-1650-08da430879b5
X-MS-TrafficTypeDiagnostic: PAXPR04MB9491:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB94917AAB9CB846E62B4A3DA6B3DC9@PAXPR04MB9491.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EDU1c0Bma/wZ5W7x3jnz02XqorYPp4wPWbOYAYAEMkFImmlcWqDxY5zdUOjpqfCWai7TWFOQGg76FkfXAHE9Nqa3vUh1nozFZuO0rc57uzqFxWw8nDyWntJcz0nYtYQPcSu2zFH0dCfyOZpT4P8UjXU7MjRox1W8yQpkdwDYP1bLvSSVi6pAXq8WC/at0WMX1saJJmo4dFLu/I0xWBPkbXAnpgWpfzNmevGSE47yShg+AygR75wXuGl4Eq58XTgtV7ua1RhfdpImeByuST2Bzhd5fFS3/Jls+MkxjD3pVaSYVS8TKKqePvxG9QnsFS9TblDa8CJAxoyYRRWp5qzjQqKWNjyz/lzW4fO3eBliWhbS30T8gMLpkGTdkE97GaDrbFbGBXOwVUrmmzYGi3QQ0calYGRGdABUiwPSWqK9CaA5wam/nXXk2aZghGOC7LjU+mXsTwDXmYJkUcRChK0LlJSFQKkCm3Bf+Uq14R+4h/IghQBcIzlOQ0bHjnqGJ5w8BTxe7CBifJ/7jR+8atgxPx9hCyNDEQ/bf4/I1nuUdLeDfmeDmQH7kXRQIWs5tHRhg5lUfFFKPE6wZ9wiN3qvjGhZ7G+b+uNCgbqcE8NUIfcoQfCrKJ0F75HRIGMbljUPzPpyRpN1nTD2TQrzyudTEaan8GK4xfdIvWx3VolufUJ9eLbNRKN/5eUl5qeI7nw4NJao4OndF63otvnIHbHpAJYPqeIOXwkW0k+Be4l8dxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(38100700002)(4326008)(316002)(6916009)(54906003)(26005)(6512007)(6506007)(5660300002)(53546011)(6486002)(8936002)(508600001)(31686004)(2906002)(83380400001)(66556008)(66476007)(66946007)(86362001)(8676002)(31696002)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U+WD9TbWRYblndem/9JDYovVj/I/oy1ZTFbQY4OMTiQJbqoCHeSYXVChj8RX?=
 =?us-ascii?Q?7fDL85+GiHxU6q5M24KC0/ZvbfHAGH1rmAtnzr12KDCJvt4FP+OHCoYJxphF?=
 =?us-ascii?Q?QTqPusgTdAwFZKnPKnLzovaTCvOOHAlOOHEXWTCc/67TwhKwV6NvxecPrC4N?=
 =?us-ascii?Q?zas5/23vTxGyPlK1JMu2lc9QhamHThyG5k+qJLBrl50UC3JadVI/IP7KbeA0?=
 =?us-ascii?Q?hLWpqX+BXM8QqlFyYLQjoWbpdIUkA/nSKiR6VqkKSPdj4HfaKeqGkMXpwpSI?=
 =?us-ascii?Q?j+wh31e+7N7XbCa7oUl5j0VocghwE7cu2+b8BSF7eNg66QOnMIuoT/eJVAro?=
 =?us-ascii?Q?kptDhPlBA/FlCFZa8pyWvyrpGHABzT6kGxYMbqIkqb4Ke3p2wXxOy7mzWAhO?=
 =?us-ascii?Q?x0RheqMeWOGjzwk2/HM1Q2Yq3bml6X1wTrb9hd2S64OzLtFGZP1C7rmvR5e7?=
 =?us-ascii?Q?nWAm3BLLO/uV+iLPvwccZALrvNwS+nUxaLLLCSrx3p9SFutQW3G6E2pMCuoi?=
 =?us-ascii?Q?mEgo2/Nbs3Nm3Jniaa2K2bmaeccq74U+9x32Hyv5s6seOEivy6g9HnFjk1M+?=
 =?us-ascii?Q?3My6DfJKfn3eOVpmzyLAqJI03BwxcIo6qQul3J2FNcLhdhwzEyObR6xQyU8C?=
 =?us-ascii?Q?tLMVc5AjsEBFC6sKDN9CmFQYUla64FDXYZ05oVp6PAKI7wzbS/tWwTopGhgr?=
 =?us-ascii?Q?GSy7IyS3O204kG635NcY/doBYPMZ6Yr0BQB3ct60W4g1QkMFDSrrwOjDtANx?=
 =?us-ascii?Q?rK7KRZqf3z0aDqlsnsbi3+D+ui/FdewxVR6nEdMJ3VCbTvgPafPzOTD01koF?=
 =?us-ascii?Q?xOrSRgOsu4NiaKny9oLadJrOKva0tEHLVyGf0rka4TgZ0szdsAC5YjvjEA9O?=
 =?us-ascii?Q?h6bphuOCv7DdxThTM9nJ/ownSk5t125gOui85lxf7qqdoTD6GMU1ZEtukdYb?=
 =?us-ascii?Q?VTPsi8NL9cHoAS1GHy6iEtCf1yhO2yXC09HKJ1FkQpwpxmOt7lIbL1K9ajp1?=
 =?us-ascii?Q?bgcGwVAClRBrn+opA1suIMEH6TynVtaHKt8l3h5flu8LLkcdy9dakpljqjGA?=
 =?us-ascii?Q?ucEzMGKMiHNQPgq6GBj31HDZOIEqpgyqcYG9c5mRpnxqHUinHLjzNcuVl9bp?=
 =?us-ascii?Q?Ozu/dLaat+TUm+TyyLBT38aHzo6w+xNrThPLfc+6z3GDt8NKQixdnfpUsp8F?=
 =?us-ascii?Q?xgaqVRI6CcBSLXd7DpkMupSz46BvRKhoNe9V5xzK0qkWNvVw2pOWU7lSVPIv?=
 =?us-ascii?Q?i2n+F4fN+u/L6ew5TSz8Wu6fUIYaNiPoKue6rE+Yhfy9EdFzEKUosFcL69hE?=
 =?us-ascii?Q?cUg8jkkOlkMj/RdBOr3MlNIz9L3A6Pjwh802uTeJdMpxL2V6RF5Uf1Tz3g+z?=
 =?us-ascii?Q?42q+x6TafGUtqA3nKIDq47PbDTuPxtfOqHBJyPhq9oNLPdO9ldvF/6tIHq/b?=
 =?us-ascii?Q?gJuECDvKprDRqpU9l3tlOJXZim9D8UV28hQqHBrXbw03urQ1MkLG9NhR06Mh?=
 =?us-ascii?Q?DvgaIs9NtrNKg/RjwkqYbO2lZe7TfMQl/+8eFNmY0frdvpsJe9/A0OddLk0F?=
 =?us-ascii?Q?QU37zt9TTkjdWL0r8IV5WSpG4584fyMlIBsnT+gMuNQVzveHVfeA2x/54v56?=
 =?us-ascii?Q?vChE3h8Q0FJ9AZt7Pf1+S9gKD/SjJXWWIExs/13himf7Qj/4okQEDV68klGI?=
 =?us-ascii?Q?ddNwYiizY4rSKE0tN9h4kkQDn8J30cu2plAD2xTUKZZSx4fzmE6Gb5ZUflnU?=
 =?us-ascii?Q?o+bL2ppAaQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6caf7c-9ee8-41c1-1650-08da430879b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 13:21:30.8462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwjcZNHQy6tzW9yqU+MdzwhSG3UZ27aXckWThOJTH6yZ9uC+61AfiiLOwCXn6F6Gi259fXBW3cRM++I+fVQPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9491

On 23.05.2022 08:25, Wei Chen wrote:
> @@ -119,20 +125,45 @@ int valid_numa_range(paddr_t start, paddr_t end, no=
deid_t node)
>  	return 0;
>  }
> =20
> -static __init int conflicting_memblks(paddr_t start, paddr_t end)
> +static
> +enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
> +					  paddr_t end, paddr_t nd_start,
> +					  paddr_t nd_end, unsigned int *mblkid)
>  {
> -	int i;
> +	unsigned int i;
> =20
> +	/*
> +	 * Scan all recorded nodes' memory blocks to check conflicts:
> +	 * Overlap or interleave.
> +	 */
>  	for (i =3D 0; i < num_node_memblks; i++) {
>  		struct node *nd =3D &node_memblk_range[i];
> +
> +		*mblkid =3D i;
> +
> +		/* Skip 0 bytes node memory block. */
>  		if (nd->start =3D=3D nd->end)
>  			continue;
> +		/*
> +		 * Use memblk range to check memblk overlaps, include the
> +		 * self-overlap case.
> +		 */
>  		if (nd->end > start && nd->start < end)
> -			return i;
> +			return OVERLAP;
>  		if (nd->end =3D=3D end && nd->start =3D=3D start)
> -			return i;
> +			return OVERLAP;

Knowing that nd's range is non-empty, is this 2nd condition actually
needed here? (Such an adjustment, if you decided to make it and if not
split out to a separate patch, would need calling out in the
description.)

> +		/*
> +		 * Use node memory range to check whether new range contains
> +		 * memory from other nodes - interleave check. We just need
> +		 * to check full contains situation. Because overlaps have
> +		 * been checked above.
> +		 */
> +	        if (nid !=3D memblk_nodeid[i] &&
> +		    (nd_start < nd->start && nd->end < nd_end))
> +			return INTERLEAVE;

Doesn't this need to be <=3D in both cases (albeit I think one of the two
expressions would want switching around, to better line up with the
earlier one, visible in context further up).

> @@ -275,10 +306,13 @@ acpi_numa_processor_affinity_init(const struct acpi=
_srat_cpu_affinity *pa)
>  void __init
>  acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  {
> +	enum conflicts status;

I don't think you need this local variable.

> @@ -310,42 +344,78 @@ acpi_numa_memory_affinity_init(const struct acpi_sr=
at_mem_affinity *ma)
>  		bad_srat();
>  		return;
>  	}
> +
> +	/*
> +	 * For the node that already has some memory blocks, we will
> +	 * expand the node memory range temporarily to check memory
> +	 * interleaves with other nodes. We will not use this node
> +	 * temp memory range to check overlaps, because it will mask
> +	 * the overlaps in same node.
> +	 *
> +	 * Node with 0 bytes memory doesn't need this expandsion.
> +	 */
> +	nd_start =3D start;
> +	nd_end =3D end;
> +	nd =3D &nodes[node];
> +	if (nd->start !=3D nd->end) {
> +		if (nd_start > nd->start)
> +			nd_start =3D nd->start;
> +
> +		if (nd_end < nd->end)
> +			nd_end =3D nd->end;
> +	}
> +
>  	/* It is fine to add this area to the nodes data it will be used later*=
/
> -	i =3D conflicting_memblks(start, end);
> -	if (i < 0)
> -		/* everything fine */;
> -	else if (memblk_nodeid[i] =3D=3D node) {
> -		bool mismatch =3D !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=3D
> -		                !test_bit(i, memblk_hotplug);
> -
> -		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself =
(%"PRIpaddr"-%"PRIpaddr")\n",
> -		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
> -		       node_memblk_range[i].start, node_memblk_range[i].end);
> -		if (mismatch) {
> +	status =3D conflicting_memblks(node, start, end, nd_start, nd_end, &i);
> +	switch(status)
> +	{

Style: Missing blank before ( and the brace goes on the same line here
(Linux style).

> +	case OVERLAP:
> +	{

Please omit braces at case labels unless you need a new scope to declare
variables.

> +		if (memblk_nodeid[i] =3D=3D node) {
> +			bool mismatch =3D !(ma->flags &
> +					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=3D
> +			                !test_bit(i, memblk_hotplug);
> +
> +			printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself=
 (%"PRIpaddr"-%"PRIpaddr")\n",
> +			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
> +			       end, node_memblk_range[i].start,
> +			       node_memblk_range[i].end);
> +			if (mismatch) {
> +				bad_srat();
> +				return;
> +			}
> +			break;
> +		} else {
> +			printk(KERN_ERR
> +			       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (=
%"PRIpaddr"-%"PRIpaddr")\n",
> +			       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
> +			       node_memblk_range[i].start,
> +			       node_memblk_range[i].end);
>  			bad_srat();
>  			return;
>  		}

To limit indentation depth, on of the two sides of the conditional can
be moved out, by omitting the unnecessary "else". To reduce the diff
it may be worthwhile to invert the if() condition, allowing the (then
implicit) "else" case to remain (almost) unchanged from the original.

> -	} else {
> +	}
> +
> +	case INTERLEAVE:
> +	{
>  		printk(KERN_ERR
> -		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%=
"PRIpaddr"-%"PRIpaddr")\n",
> -		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
> +		       "SRAT=EF=BC=9A PXM %u: (%"PRIpaddr"-%"PRIpaddr") interleaves wi=
th PXM %u memblk (%"PRIpaddr"-%"PRIpaddr")\n",
> +		       node, nd_start, nd_end, node_to_pxm(memblk_nodeid[i]),

Hmm, you have PXM in the log message text, but you still pass "node" as
first argument.

Since you're touching all these messages, could I ask you to convert
all ranges to proper mathematical interval representation? I.e.
[start,end) here aiui as the end addresses look to be non-inclusive.

>  		       node_memblk_range[i].start, node_memblk_range[i].end);
>  		bad_srat();
>  		return;
>  	}
> -	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
> -		struct node *nd =3D &nodes[node];
> =20
> -		if (!node_test_and_set(node, memory_nodes_parsed)) {
> -			nd->start =3D start;
> -			nd->end =3D end;
> -		} else {
> -			if (start < nd->start)
> -				nd->start =3D start;
> -			if (nd->end < end)
> -				nd->end =3D end;
> -		}
> +	default:
> +		break;

This wants to be "case NO_CONFLICT:", such that the compiler would
warn if a new enumerator appears without adding code here. (An
alternative - which personally I don't like - would be to put
ASSERT_UNREACHABLE() in the default: case. The downside is that
then the issue would only be noticeable at runtime.)

Jan


