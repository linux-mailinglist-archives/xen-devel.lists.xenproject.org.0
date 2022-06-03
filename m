Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3FA53CA9E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 15:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341516.566747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx7IB-00080a-TR; Fri, 03 Jun 2022 13:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341516.566747; Fri, 03 Jun 2022 13:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx7IB-0007yo-QD; Fri, 03 Jun 2022 13:24:43 +0000
Received: by outflank-mailman (input) for mailman id 341516;
 Fri, 03 Jun 2022 13:24:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MD4n=WK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nx7IA-0007yi-AJ
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 13:24:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 862164a3-e340-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 15:24:41 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-L4Ggy98INCOyRBxp4Ta6OA-1; Fri, 03 Jun 2022 15:24:39 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB6308.eurprd04.prod.outlook.com (2603:10a6:208:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 13:24:39 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b%5]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 13:24:38 +0000
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
X-Inumbo-ID: 862164a3-e340-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654262680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/I5zZaeAkEMmi5YQBwsUh7EHJ4817ik95m2Kt1PGYME=;
	b=ALWzu+3o6SP7Kg9MMJ2P1x50I0hqu/rRMFKCVPNp1NyetqWcTJ4lRtg29bTNkg67wEbbMi
	A6o794SG04roOaEeJtzMyrQ7yeUPcrRHBzbZ6Sj8kWabRK2hTxxejqQVFmN7ACPMrm+Bhf
	9ft5/MTvOys0fXXJPVH4VDwksq/I3rQ=
X-MC-Unique: L4Ggy98INCOyRBxp4Ta6OA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9mmHqrHyLtoPqezXfPTW5Pp5Q97w8M23pVW+eImZNYsEoV9wxNN4krpJEVHj78+KYt4unw642DWydRtwcb0lwTXemoIuIiYPh/un1HrybuDjEWiWbvrpRMYa2ElB8nq6WZAzi1NeT1ub9ThqdT7Jq0qXOXl9RyfsCEahDwvXhcRaRA8/tp8UgbZGgQ6TAdAopHWNTQfgR0MIIMYlQW8MmW863TQUi5ENG1ZAKCMRcSVmgYEaEOrm7rk64npRzVaGjdtDUVJefaYbgDo2vesFniJKvLRKl8dTgt4vfnf2eglVsV2c28Z2FSqLHgAS9QgEkSQHM206qAJDzw/UFAdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+gnUXqY97Gbhx/6t8uCAb+z73FX6uTiHPoZvGJiS7w=;
 b=cuwPUi8MMSKiZOqXb81lGo9wgxi2y/4UE18FWQNqcvjekN+hy78aH/0iUNYaOkXdL4520QN43I+OUfbAz1ubyk1BRLhYdu3CaLhHeXdfOeHZQLu9WQ+RhEqGxoe2lxdivwOmzhAlGobx3IDObNu0V+W0XkuBtnjmiSXX5Fbac0MqViKELrhMxzNKbsprYTnvn+sSfgYfjn6tTL/KVQaZLTnldYgbM+KaLsylEHmbh8mi/LfD6yIK0g4Tfaype556dQRbsWBJXNUBblcoQBgJuRN6KaVZxF2yuUmwin2ShnBx87YxXW+wMbvsT9Gg5NSuj5GVkRWf2u2igKTNo7ONWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b14d173-b0bf-f8e5-70c4-2c9a3085bffa@suse.com>
Date: Fri, 3 Jun 2022 15:24:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RFC 2/6] x86/ioapic: add a raw field to RTE struct
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220421132114.35118-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0035.eurprd03.prod.outlook.com
 (2603:10a6:206:14::48) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6703bda9-9416-4a9c-5633-08da456468ff
X-MS-TrafficTypeDiagnostic: AM0PR04MB6308:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB63086A3CCC821862C8EDC491B3A19@AM0PR04MB6308.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OTY8eqMDaw0Hu3U4fvfSlVIWxSUiITR256rN+13MnGRljeQBaaYkBUCOzHn3gmtIFfGLnR42WkNtcCjyvUxnIh3Ddea4+/JTtFTImNru8ZkNDTuHmNQjuZpuzmbHM0IcnR1aXWlBFxxPQr6honaL0QSYJVaEZYf49YYbb69wKj/Cdpz8k3sqvfyMqFyDRssc36JUvEz+GXw3I+Ezf5CuO7I887BTgiuwb7akICN/iZ6V+EIMQOqrp8uHSrDbE+mwvksT29b+s4vVqmJgCvM1lcPcC/hDJseSUZKVrBcHPRy8bHxowvu1epPzTWmn2F7r8rmEZ2rkUu1scvm4TYDQCqJl330UU8mk2gaSQ2kutnxUjl7riOlPEpI+RfyUho2eIAHlndORlV3rdDXUj40xjpPlpXmJYypXuMLNb4YVdDcAk+CyP3kQqvLrNftnoNnRtDRnA0wLQoYZ50ixOAcKBe6UH0JHHUQJ/NQNLYX+9FQcd45L53Lm+Az6E+WPGt8ooVwQ9KFnEDZuQU8rIDNlBMIZNQ8G9cuJuuONUQFF9kBfmfZjYsA2cQb5sRu9eERRjDc8I8MsSMA31PMZml8MW1GcI+R/rihK0uBceLSpFGBjmUfgoKjNzIjYIRb/cL3XV2ExNW9LXWLRIxqlD4KYN9APN5d2M71MBz1/7lteXbzktyIWoPLIgU5jF/qlzJgMqJ4ceTYQRh3FEC+SLanA1ISxQnv4lSDGrTQlSRyyWac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(26005)(2906002)(36756003)(8936002)(186003)(6506007)(53546011)(5660300002)(31686004)(316002)(54906003)(6916009)(86362001)(31696002)(6486002)(2616005)(83380400001)(66946007)(38100700002)(66556008)(8676002)(66476007)(4326008)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WcRlo5ZjY5dTZtspcP5/wmrj3dkFkBf0WNi9W+CM9X8OcdI63HfHOy0m/VL0?=
 =?us-ascii?Q?7xOuxM2Xk45jseZ6IoUgGSsf3kOqwzHqv3+4O1FpXq5jqxvHVXT7VpSi5Fpn?=
 =?us-ascii?Q?cW4TAIiTtz+g9A+v5a9sKgPTPhk933rrohavtJgZfLoBCnEPEoS8f2PBpGK6?=
 =?us-ascii?Q?t2eu/b/jQYMMj4JyC8orHH7YLAkhC5uJmAJqTF7AVsgIHt9bWIxt/q6njaCH?=
 =?us-ascii?Q?zkoZYbzDZCaW5Lmwu0eqYYto87T2F/U7uFrOGr+833OejUxBAq5/FLdLfK6J?=
 =?us-ascii?Q?myWLBAvYlg5jSipsf3eVA+DFKCI74UJqqRz82tc0C+ybw+G6VCAoNNPdashz?=
 =?us-ascii?Q?w4Y8nVxG6dnUtnA3HnRxYiNQ70v6aBMJ4qquk3FpHZiTSGosFh3N1sfcCnp4?=
 =?us-ascii?Q?l6jQWrRUhiq0a4MJ4ZRz8z+/WOWRTK5YcbRrMGrEyxbAOymkwVv8HWAwGNwZ?=
 =?us-ascii?Q?RqssRNt8VxgVw11CYvSrIb9pWZcYwTKvXX3d0mRkA0iHbJbQtQLJHfpe03IY?=
 =?us-ascii?Q?9RDoOssKZ04OW269xWMlbFfmF99wXWvb3NOxDDqiNQP5hIDtuTWB4zaseaBX?=
 =?us-ascii?Q?qNGe1C20VOH3CrpBC3sGUYpoIF0ltS68YyX9lxTuXLO76e2U4ykh7Giy8dqh?=
 =?us-ascii?Q?myFvyyVX9RP7hVH3LtzijxpeWiG6fOW/ss/OfRmlV3SOFPTylN/50mw/4fN2?=
 =?us-ascii?Q?KH9q54r84k3hlNMezn1p4vNOE4IDb6RfgZFcnsrTjlWyk3FjuMwjIGVKILeM?=
 =?us-ascii?Q?oFPWGLxK/8fNiPUwuARU68py6H+PYXKPvvdlZKWsY2mx+IITD72tuLzD9vff?=
 =?us-ascii?Q?lX8D4yr2x2yP6VRrxjDpOycD91xtYZ9BPQMJ0dJc5PlO/olNBkB3WKgeIRDL?=
 =?us-ascii?Q?RhtqpPjqTacSxDqcwwMQ4JHzNjzVUv6U9eoP2bqoCv/ecC21vwjLjcLBqEyQ?=
 =?us-ascii?Q?PhnftUu8n5oTKsfUMatUmsLC4HMQOAxJJGcWPvlK/O75dbXi9A8ZK+yy4xSZ?=
 =?us-ascii?Q?5nMtF443n8k682DNfQjMa7kkUtHfmLM1fZcO0r6EEQYwcfj6aOuUyLZ72Xal?=
 =?us-ascii?Q?kz57gwavlLk2GzuNd2gQ9+yQwJZBqyYp2qJhAJF8unizCvDjDeP26UhRFLiF?=
 =?us-ascii?Q?elKiQWvOPyDS/32lDdFv8zBXO2GkpjbPGbbQQCBuBgjLZmign8mtdyTNWkBW?=
 =?us-ascii?Q?0lh5hImDpzhHTyGTn1V6O+lhiwSdLstkAKx14Ostn9BFx7OC+ROMUqnikCq1?=
 =?us-ascii?Q?/NjwySTQ+8mk4frsNksi6gQPPDJfHsmZ916wCZNva3PDwTLb0gl+JHS+DO+w?=
 =?us-ascii?Q?C7UnIBArrTKhOf4q1MVMwoekE5D0UGUdl0ccU8MR5GAW0p/y+TETVs5lDRz1?=
 =?us-ascii?Q?C7DM/NziCUBJ2S+HsdckvtES7lF2pfkDODyd8HhYP8ZhJBE+OL2ozmWdHvtZ?=
 =?us-ascii?Q?qQyNYSVbHaQtgtGh1HDJYrOCjDiRQ0Rw1q+wvq3I1wc8ABK9Eht6ZZ8+lKUF?=
 =?us-ascii?Q?7A6z+vl27E5Xz5FTuntdD6NNdHxKVUpbfKg4AMs1Vd4/7cBz5jY6XkOCqsnU?=
 =?us-ascii?Q?JmqecHJu2etBDAhWiVvuyH6zGuUTdPPh4tcmHmbyd8NuO/k/VXVOYECWKWjA?=
 =?us-ascii?Q?84/6vUFyRDHO6yAmY0Zqq8ZaAW6fknmISPz5AUmenvcufEwMaAs/4gNqF0wq?=
 =?us-ascii?Q?rpD8MDUmJEw7ZIkQBhlfN3QYnbP1Wa+HEgPUIv8rhCrNCACksA0JwYcfFi3i?=
 =?us-ascii?Q?szUQUsYxRA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6703bda9-9416-4a9c-5633-08da456468ff
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 13:24:38.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8V3ngOjR0uBOfahYG/UZyBR66zxdXGanSlOv6fotISLKo0tpHW/ysMxBoPGvvgeO6M0Mqrchcyomwih6ywuE2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6308

On 21.04.2022 15:21, Roger Pau Monne wrote:
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Once seeing the purpose (in a later patch, I suppose) I certainly
don't mind. We do have a couple of literal initializers, though (see
e.g. the top of ioapic_guest_write()). Do those still compile fine
(warning free) even with old gcc?

Jan

> --- a/xen/arch/x86/include/asm/io_apic.h
> +++ b/xen/arch/x86/include/asm/io_apic.h
> @@ -89,35 +89,38 @@ enum ioapic_irq_destination_types {
>  };
> =20
>  struct IO_APIC_route_entry {
> -    unsigned int vector:8;
> -    unsigned int delivery_mode:3; /*
> -                                   * 000: FIXED
> -                                   * 001: lowest prio
> -                                   * 111: ExtINT
> -                                   */
> -    unsigned int dest_mode:1;     /* 0: physical, 1: logical */
> -    unsigned int delivery_status:1;
> -    unsigned int polarity:1;      /* 0: low, 1: high */
> -    unsigned int irr:1;
> -    unsigned int trigger:1;       /* 0: edge, 1: level */
> -    unsigned int mask:1;          /* 0: enabled, 1: disabled */
> -    unsigned int __reserved_2:15;
> -
>      union {
>          struct {
> -            unsigned int __reserved_1:24;
> -            unsigned int physical_dest:4;
> -            unsigned int __reserved_2:4;
> -        } physical;
> -
> -        struct {
> -            unsigned int __reserved_1:24;
> -            unsigned int logical_dest:8;
> -        } logical;
> -
> -        /* used when Interrupt Remapping with EIM is enabled */
> -        unsigned int dest32;
> -    } dest;
> +            unsigned int vector:8;
> +            unsigned int delivery_mode:3; /*
> +                                           * 000: FIXED
> +                                           * 001: lowest prio
> +                                           * 111: ExtINT
> +                                           */
> +            unsigned int dest_mode:1;     /* 0: physical, 1: logical */
> +            unsigned int delivery_status:1;
> +            unsigned int polarity:1;      /* 0: low, 1: high */
> +            unsigned int irr:1;
> +            unsigned int trigger:1;       /* 0: edge, 1: level */
> +            unsigned int mask:1;          /* 0: enabled, 1: disabled */
> +            unsigned int __reserved_2:15;
> +
> +            union {
> +                struct {
> +                    unsigned int __reserved_1:24;
> +                    unsigned int physical_dest:4;
> +                    unsigned int __reserved_2:4;
> +                } physical;
> +
> +                struct {
> +                    unsigned int __reserved_1:24;
> +                    unsigned int logical_dest:8;
> +                } logical;
> +                unsigned int dest32;
> +            } dest;
> +        };
> +        uint64_t raw;
> +    };
>  };
> =20
>  /*


