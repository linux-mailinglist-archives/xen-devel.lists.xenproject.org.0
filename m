Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A6D50E171
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312926.530336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niydA-0007tv-1q; Mon, 25 Apr 2022 13:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312926.530336; Mon, 25 Apr 2022 13:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyd9-0007r9-Tt; Mon, 25 Apr 2022 13:19:55 +0000
Received: by outflank-mailman (input) for mailman id 312926;
 Mon, 25 Apr 2022 13:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niyd8-0007r3-DO
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:19:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 640c6a02-c49a-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 15:19:53 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-6TxNJtmjPrWEM34FaYPfDg-1; Mon, 25 Apr 2022 15:19:50 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB7063.eurprd04.prod.outlook.com (2603:10a6:20b:11e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 13:19:48 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:19:48 +0000
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
X-Inumbo-ID: 640c6a02-c49a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650892792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/0kzGoXwbe14WooJd/Nl+yIoDBYkoe4bMHCbvRqz98=;
	b=IPeHTCp9ydzqOKzUnEQfBqRDofWVae0kYvVQL8EI+MMobI4LuQNaFrS4K9SYYpZBJlyyEU
	cvv6G05z6Nf3Eg/ckp46zKznkkxfKlcii4PyB1YxaMugks9wVXcj22Iis9LUsQ7goJKNkh
	lc32TSxGfd7xUMy04NSu4xzByT52vZ4=
X-MC-Unique: 6TxNJtmjPrWEM34FaYPfDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2Ys+a10r68eQk2aTZX8phs9kMQ9ys6H5uwwJ9sQ+FIXJAunTtc0/7PsmjxEWiub3RVhRAy0K6O22SbeB20GWlAIIv4ew0TMdqJ5cYKhuVDS19W5NMLa+ndxivuTBAnoti9RHhzpbE7yKYohdCeNaMQeW9eyGJs6/SDWvJ028XKJmlT70BHPJggjI0SP/mspg83+jUYYcK4r6rLpGXwtmauxw1aDIdOH1HQj5VxbR3sG9Epba2DxobAl8vCwwpiZvvyuXaFxRKQgvwfwk2e+ZAVsyFbBXNwypAO5oluR6FLgYav26t39pjKfrq9LakrKy6aUGAESCGxSVnX63EduvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ1uj6j8FX4J98NPRSUhT/TpPhE1EbUt2Bdu9IlpLpA=;
 b=gUqA03pkAruaRbu82m+4+E9Pvkx4I93112O/002Y0PuPiRr+bMvHK4S8bA06AtCKEOdsQFw+8hV5/gOx2IHgJG7dMg1LjkMnIN8hglrwASrUkbmHTmRx/bYfyocNxPqxjlDk5QvfS901wTKHtVncpaqyxLHBJmMt51Z09TRJAdVNn4vQ5EruifuHwbhuLU+V+ef6yKMwDTAhiljzaXL7yhz03f52/YmH6aj2bHXWGLvnxXyYWskArQAAPYzlfSxW+tPFu9J9VwHtzv3lFQ5sR3b0vSHzealDv21DeWKUhBXJF09Uv6OftUltIXm9f988RVjfOzNwe22bddkCp6eryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <039010e6-523f-851d-a432-d7f1a2fe5eca@suse.com>
Date: Mon, 25 Apr 2022 15:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] x86+libxl: correct p2m (shadow) memory pool size
 calculation
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <368e2d54-09f2-2081-349e-571bfeab13af@suse.com>
 <YmabFt952DO29pIA@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmabFt952DO29pIA@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0202CA0039.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71cb6087-5d0c-4147-3782-08da26be45ad
X-MS-TrafficTypeDiagnostic: AM7PR04MB7063:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB70633749B1C9AFE539372F0FB3F89@AM7PR04MB7063.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TDtW5cbzj1vOOISC69F1Fg6MHmXKv3e4ekmDLTX2B3qua3ND3zMT7wgoEQEH2YOwB4W5CRIv4Q006HynKabTPiG6hnSbQ6L2mIvnNinPt2MVIr9ka4bUekQLqV6A+1mhpuXQS6pKHYBB1pJKJMtfmJpa6MmD/xKdP3oLhsPZdXso01PyBCqj1AnfLq4nI8pydeVXMgUFFSOXdhMlqnvLx20OGCSayYZxi/igkCUUxHIja3te5ojimgma/3bRZlWT2aTUKaJzw009SzVvfLJMGN6DDxTQ1S/1FgSYi0HJP3dBUQ5aOKhgMd6OVNNdeUW/+yNYT0onWt1w5pXtfwhAf3r7QRHa/Nu/fWuNyrFc8ff5zDsc44WNe/+qAQPnFdND/+ya6hoACU+E29rk+nQLerkZj5yslwqdtQWRCQQO2L6oYI2Gv+3TPyOwBZqDSWBu81YOJrVzwgldyXMw6rmZY44WEAEVaHvp8v+zjloc3indA5EpVkjwWtTs1gRX4ieGN9kuYnenTaOxtFuOpNwrT1H1bM3+Z+iyicQY1pbm+ef6NnlyeDluauny/p9tW24pOZS+3nSVa3/6y+HoIvFI2relV1/h5NHpfOmfoI1bohkctoIvyLW6EKMvxMSqSkig8KsaTuQvvtKlD/n04gFOUFbvVawaQcHiu3N8GbB/M9LSsMEzadR0Oe8/sUAx3D6YVaKmHw3p7/JUXJ5LHGD6zOVDuPtIDJlHg+rd7fGhJRU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(26005)(508600001)(31696002)(66476007)(6512007)(54906003)(6506007)(66946007)(66556008)(8676002)(4326008)(86362001)(38100700002)(53546011)(316002)(6916009)(5660300002)(6486002)(36756003)(107886003)(186003)(2616005)(8936002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FkWRwA5o6Wbm6vjRZJRmicYu0D7uzsUvOASZ7JZt9hExuAcCRAs48gEwAsiU?=
 =?us-ascii?Q?tp+BWfNtyDbgf1Rv14jWGV6+WcUO2dSV9KTRUTbSLFDvj/pR2gOzq7sKxbgd?=
 =?us-ascii?Q?M3jvaSmHaIIRs48ih9kX2SHzT2c5SpyfjzSVliT7xACWHVV20o/3JpsYdwRD?=
 =?us-ascii?Q?x0wG22ZKojz6lVPi24od1tYB7q5aIeN4LALtW9EZZM5A5fcJfv4FLnn9OUai?=
 =?us-ascii?Q?BXjzGW/MNpVOIIoyKeR9TdZechUmoAQXlWx1cmAQQLPeEw3ObTEInZO6wKg3?=
 =?us-ascii?Q?xZr7DHxxAZ2mmgOvA8l9zLJV5NvYzhWTTkniyk2c1YQNeBpDX47uUq2TgmQl?=
 =?us-ascii?Q?pI5EYPJJR3xy17lUx/jKLpyfre1ndkpgNuCwgn2YO5JnbDKywOqAfYFuNqrB?=
 =?us-ascii?Q?6Pfk6ha85BlvtVp8dYcI23NnjVtqppFRc/PL5dFeQTlmiRfhWd0fkbBtntSN?=
 =?us-ascii?Q?S28y8F+UFUI55jxH1CZIkzAldduIboujLdkkQZbh1JZB4Xv2Ix3HnpthGGl4?=
 =?us-ascii?Q?Y1lMI0kLJecmhQ68EVbl1jUPdBPe5WCRgIqFqId7I8nEUkAfE43xfUzpvdHd?=
 =?us-ascii?Q?U8woh0GaykewMzlP9l59LvqdsHx9P/MJK822sYEZ6kCUIw3E8b1VINjNjdql?=
 =?us-ascii?Q?efxnnJDrhuSOvbmXwJ2zhjbHW/t45l2ZvEQGI2zxYXiYtyfQpB05jkWElhV9?=
 =?us-ascii?Q?RErpssVUdkYgR9ydR4s3LENB/GagRJiwaIjw3Xh62BjnNqO9VbvnYJbwIL6D?=
 =?us-ascii?Q?qwQT7JfOtB3Y7JRTAyWztFnwDzSMY8wNTKKNlvzXo+x7kJ9zAEjUhZwem6TQ?=
 =?us-ascii?Q?seHCqzJxqrn+Qw8J1Zc9V/7Xj0fOgEQ1OtCCqqXvby/S3pha6aD+QUlMtP6g?=
 =?us-ascii?Q?EreaqTCKZh5KJKa7AKewx1N9EP8AqdihcD04+AWNNBqKhvfm8z4xYC6oZ7wl?=
 =?us-ascii?Q?j51R4G9zq/fnNWLXhJ5FB8pna9Qo9F0Wet58LSiZyWOVhJHay5M3URz2kdcW?=
 =?us-ascii?Q?Y6yZ2Q3oGyQLDof9t96XI/1Nf5Xix+cJZ7y+Vqd70buXRmIJn8L02GIaSnQF?=
 =?us-ascii?Q?zbdsSsTKg56jYg9CHQQL82X97IiG2i0kSV+l14NjECxc59L67Nrz5Rq0uNGS?=
 =?us-ascii?Q?6jFZVUf2Cyg5s8Z1thBe9IcgEW1lMYRGqtvNcVByh9FEe8C5LN2UbzlnHOId?=
 =?us-ascii?Q?4trkCWxQo4b2EPv94lTRB/PL3gHBhU476FDijnFQkObaIeU4gAuSSm/0Eiai?=
 =?us-ascii?Q?ozvWoGfQtOjqkqQGsK7fGVIdqKASJQrik8EV9PrioBl/vsYxdoQas70j14oW?=
 =?us-ascii?Q?9gszQAyIShOB66oi97kfRdy8O0YeiOsh8pUJ//LdEUWKfOov5H3gOFJxfnOy?=
 =?us-ascii?Q?e6R+OaAbqDlzru9DksSmRjtqQLv8IvI9yj+VxXLMHieUcD+YucaNoqi2Qjg9?=
 =?us-ascii?Q?dghJA+rwo0x8uGDu/SLezeSGnCse6BkdYFng3srig7CdcD8umTNCL4S7tott?=
 =?us-ascii?Q?ViXYkM1x+AEaYcnBWyeFGW7+qR3L2IzCei/E2ksqDcWcIOuEi0r8syg4yete?=
 =?us-ascii?Q?R6/jX9kX3CNRUTkMOF08XfqI6Fdy3RdoxxOg/U7sm4E2mGKZ3BtXZhAKY6v7?=
 =?us-ascii?Q?y7L0LSAU2SLhkDOhc22FsNomXxFJOeRd+9JBVUTK0OaPepGPIrXZQUPs23SB?=
 =?us-ascii?Q?IM+S5u3y/KaxYSMQp2Uu6I+HNZYYwFLc99YB1cms/M7q8M0+SW5TpHmV6G20?=
 =?us-ascii?Q?JWplGM0KFg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cb6087-5d0c-4147-3782-08da26be45ad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:19:48.4404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4yq62uMGnHd8NvZyC0VGlbO28EfqHpaJJ7akHUXL7QE+ngbe06hChQaNjW/BhOpsrTCq6oX32rv1xaRPjj7tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7063

On 25.04.2022 14:59, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:49:34AM +0200, Jan Beulich wrote:
>>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -317,9 +317,12 @@ unsigned long __init dom0_paging_pages(c
>>      /* Copied from: libxl_get_required_shadow_memory() */
>=20
> Could you also update the comment, maybe better would be:
>=20
> /* Keep in sync with libxl__get_required_paging_memory(). */

Oh, of course.

>>      unsigned long memkb =3D nr_pages * (PAGE_SIZE / 1024);
>> =20
>> -    memkb =3D 4 * (256 * d->max_vcpus + 2 * (memkb / 1024));
>> +    memkb =3D 4 * (256 * d->max_vcpus +
>> +                 (paging_mode_enabled(d) +
>> +                  (opt_dom0_shadow || opt_pv_l1tf_hwdom)) *
>=20
> opt_pv_l1tf_hwdom is only relevant for PV guests, so maybe it would be
> best to use:
>=20
> paging_mode_enabled(d) ? 1 + opt_dom0_shadow
>                        : 0 + (opt_dom0_shadow || opt_pv_l1tf_hwdom)
>=20
> Or something similar.

Originally I was thinking that people simply shouldn't use the option
when Dom0 isn't PV. But meanwhile I've figured that late-hwdom may be
PV even if domain 0 is PVH. So yes.

>  Maybe placing this inside the sum will make the
> expression too complex, so we could use a separate is_shadow boolean
> to signal whether the domain will use shadow pagetables?

I think

    memkb =3D 4 * (256 * d->max_vcpus +
                 (is_pv_domain(d) ? opt_dom0_shadow || opt_pv_l1tf_hwdom
                                  : 1 + opt_dom0_shadow) *
                 (memkb / 1024));

is still okay-ish. Note that I've switched to is_pv_domain() to be
independent of the point in time when shadow mode would be enabled
for a PV Dom0.

Jan


