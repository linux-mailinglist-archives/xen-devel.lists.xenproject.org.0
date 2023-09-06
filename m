Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10E793717
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596333.930191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnoD-0007Ds-8b; Wed, 06 Sep 2023 08:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596333.930191; Wed, 06 Sep 2023 08:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnoD-0007CA-56; Wed, 06 Sep 2023 08:22:45 +0000
Received: by outflank-mailman (input) for mailman id 596333;
 Wed, 06 Sep 2023 08:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdnoB-0007Aq-U5
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:22:43 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c9abc74-4c8e-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:22:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9209.eurprd04.prod.outlook.com (2603:10a6:10:2f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 08:22:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 08:22:40 +0000
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
X-Inumbo-ID: 8c9abc74-4c8e-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1g0yLe8eU6/EmBzihQiF68G84NCee6chz2RnUgaDWMm/l41MGsSSLJM3Ottvj3zozTVJs2rrc+161r+QHfaVdGBluXDid4GoazEKf/4X7gNR7uBcnHqLYLjzBUKIozwE2WalBHWE/4w/HsmbwzlyHR/38zCyj42fiN8Ts0cnReRjOAsJ+NRfv5r18ngMYG/xpIUAT/DCQ8Bsfau1OEL8MoLBehl+8nDZxnzjZK3CLt7ynwD8A9q2mrxe68f+i/VGfi3sl6qnxQYAZ4TAXu/xAjfiVSodOaLjh9DN5i//VlGziD/d4LzBDm0k7qQrv718KaWWKjaxw8xtq+8tXhLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmntcxHuofnsEUjgQ4LYo/WSavnZwuNq5K2lRPcThdI=;
 b=LROPgFAN8FYnvUIiBP40vVbrBtebxLYpRPXJFIC11qZ0j75XwV+fQ5DC0goAqf5r1nwMP2RZiW/WbLYifqw4df21y/YEjogFzijz4PT8TlOmm6/NVzGHvOjMMumy4S2dlRZR4/jNBaRfu2UOPj+jmDsi2DQQ98MiaWLLimv/EB4V+P6ZSl3dBJAmT5ERYqc5VWR/cCe9TRDjyh4xSK6eMX0iUJpI5w/0pdjHZQg9/YbC0x0Zeft93RRhQriIQBrl6pEwgynhoDqfHCS6AZ5a3KZSOOp2pRA/LxfnSxux3nGKIGuxsyFGdYgoY1GN52CMdRWtcBIMsCiER4AyHaEnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmntcxHuofnsEUjgQ4LYo/WSavnZwuNq5K2lRPcThdI=;
 b=pf8McBhRSYsbOjc0gWcJN7Rl6zXqQqxxSHJJOcHQWKl+26ssmfZ1TfkKR4BxZ8UiJI502KZmWCq08uvOmvyFLJuXhB+tGWjOFV7OFjRxM81+eHNlhNJn0J6owoeUuK8qWvpEFKqlUw9y2lrd6yieD3mDCH9geQkogtfhir7CIJYP9FUA4DdMHN/MAwDYfOmRkulax503KoHJQnM0doGszSAJqzOZPw47C/S65mpbzdb8nJdp4btgutsFvOqOuy5lDdfGuhnwIENPUsZ9zuRVJczMCPtCClv52yhmlxUYfXGy20TWWJtFb6z6/OxejYn7fUAsL0BGfXVpmybK0ol7fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b816ecd-e7a6-c6a9-9b42-b9287deac111@suse.com>
Date: Wed, 6 Sep 2023 10:22:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 4/5] xen/vpci: header: status register handler
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230901045742.235975-1-stewart.hildebrand@amd.com>
 <20230901045742.235975-5-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230901045742.235975-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: d21eb668-c7f4-45ad-af4a-08dbaeb26f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sYKX7sXYEO2V92iec1Y8BVWEigmJTkQOOzg6yQLDK6HlSzSHYQGON5Rct8c3kPMbwgCFlCpWIYzmM6w6S4h9PWjSgMhjrJ5UlFRzvDPzZ4zwSDtwSWe2d83/rf/Vk9Q1yW1AU3GNdq81jLNlPb1539gwu8Ge1CUtJ8PBAfj2bLe5tIsv6gzvPZhHhfOTaABFlO2KGKkEMI99Q3oHP+ebrKOxka9T8llYaX4BJwQFLbjMXu6/7fENvbwAE9ixFi+M1DOS8xWcD8adhfAuA6B77m6nWbjRtAWx/B5w6RPhzGm5iTFG7X86dalcN1SrS9Qmk2b0lcuGJt1IPKc9ChrzQrN/dV17ol8m5zMCM7v2DjkGQ8MjNk4qFT2j0jBoZiNCez5SQVyBYpMmGFhmewT+EBzQSTREhxuIEEQrk5RabR9yk5lrnNBAgeed2TJ+AGqbS3B6CSLW2KuF/peTw3+5DrAxSplGa/8LV2shaYfIdRjmW/P6e/rzsCNUm0q70dJEsKXZmG71ZS4VenbH9wK36g3Luu96fen1m3nW3MbBoeWbUyZWuq7XZb8s9N1Ys47jh11g2s3700JKeqJy8otV5h+g4+3cBqbS2Q+yzd4Glq4Qdd8sPCL7uEXfUM6uDHk002ETfe9RkQlaGLNM6pD87jutttqZFNPa1Jj4Zhxb/iA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39850400004)(346002)(186009)(451199024)(1800799009)(31686004)(6666004)(53546011)(6506007)(6486002)(31696002)(38100700002)(86362001)(36756003)(2616005)(2906002)(26005)(6512007)(83380400001)(478600001)(66946007)(316002)(8676002)(8936002)(5660300002)(4326008)(6916009)(41300700001)(54906003)(66476007)(66556008)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzN1T3MwU2RPRXV3ZUQyajVGV2NqTlVYS2NnZkhCSzdCV0hWUzc1M2diamxy?=
 =?utf-8?B?ODVaMks2ai9zSWN3Q0tFNGFCYjF0ZU5KeitqSDdBZnNJZjBuYVA4aVA5aWpk?=
 =?utf-8?B?UkhuaXUxdWtuNS9sVDVGTGlTVEgybXozUXZaVm9RQjFOUEhRNGF2WWp0TWcv?=
 =?utf-8?B?d1FNTExXcUU4NTZMOU1vczVicjhoRzBCZkcvOW1YeEkrQjl4bTd0T0dFd2FG?=
 =?utf-8?B?RndxdmZRTXZoNEx6YnRYNHpBeFVEdXpmU3lNTC9LRWJKeldwY0szZEpCRXFS?=
 =?utf-8?B?Qy9sZGtlSy8rTVJXczk2K1hMUXVaRG5zMy9aUldud3JCNDRHVUVlaXgxaVRj?=
 =?utf-8?B?RnFnR1hVSkRYYWZHUVFoS1R2eFloZk9NdnB2Yml5cVdrZmVhYjJjTVhpR3Ra?=
 =?utf-8?B?YlRPWnFLMWQ1alV1Q3NEWnRTYjk2UUdlMzVDZ1MwalNMQStHSlF3ZGJiaU5o?=
 =?utf-8?B?elc5YlpkQXhHUkRqUmd6SWhrbFVDMmVSbHpEdTVaSEl6Q05kYjZoSEJvSlpS?=
 =?utf-8?B?NU56Q2o2MXRoT3VPZVFjT2F5NDFnTk1lRHoxV2dOeURaV3NFMHpDK2RtMVZF?=
 =?utf-8?B?M0lRZkszUFkvNk16Rm1KaU1CNEQ1emVPNWxaR0dlYjFuOXhEK3RRSThZcktI?=
 =?utf-8?B?NkVlN1kxbFZVNzE1Q1pjdUNKbXRwYjIwWTNVVkNHM1Q3L2pKQW54RmQ5VXhR?=
 =?utf-8?B?ZTJzalBNMlNVYTV5SmtkTWVCWVQva0NjNXo3aXR5U1dvMzA3RTlKNjdDL014?=
 =?utf-8?B?a3hpdHRMci9WUUxlekg4WHM3OGZ6RitBWWZER29MeHJTNWl4ekZxU0FjODA2?=
 =?utf-8?B?VkRUbWRneFIwK0g4R3hhdE9xSCtBUXBaMzhONEprRlU5bXJhUWRXTDByWkwx?=
 =?utf-8?B?cUJpT25RY2RlcUNiaWpvbVU5SWkxcjRFOFdLV3c3VnhKNmYrQUg0VmdLVEJK?=
 =?utf-8?B?L0YvZVgrbVduUmlXd1hJZU13WEhIeEhqcDFQSFBYRXhuNVlDemU0eXMrekl0?=
 =?utf-8?B?MnJLU3FNaWdYQVRXQjZzQ2ZqVDlkMVVyV3JYYlM5Z2tucFNCOUR4ejBkYVZQ?=
 =?utf-8?B?Uk5POG9jL1Jaek1rck8rQVY0aFBHeko3QzhiRjRwTjFXNDRWS1hveERDcTZR?=
 =?utf-8?B?M3NOQzZjNnFOMCtYNWZUNlA1SVVOdEs3VTYweG13cXJPUjhiSUdjNjhyRU5Z?=
 =?utf-8?B?ZWg1SnpHSU8xSGk3bXZ6eGR4ditzYUFNTVdVTXozWWRXRUtlSEtDTHNXTnc0?=
 =?utf-8?B?eGR1aFBxYk1KTXZOVElZeGw3YXhNWHd0c1M2VEZtV0Vpd3VHckRYRkVORkNv?=
 =?utf-8?B?QTNwSkVDY0RFOHQxOHc1dDNldkdPTEVrQ3I4US9DTkYzUVVuK0txYVAyTjRC?=
 =?utf-8?B?S1NJRWV5RURTWXlIRCtLUHNiVXk1QXFhVThnUE1YU3IrQkhuRDk5WkNFMnBF?=
 =?utf-8?B?WHhCS2w1UnRJTjI5TDlVbm1BL1ZLR3VLSnoyL0c3TzJ3bkdhbWJTQmZIUndo?=
 =?utf-8?B?emR3UHhPZjN4N0lpR3NWcUo4T0Nrc2phVUlWRzlYMlFXK0t6bzh4V0VCbVkv?=
 =?utf-8?B?THJka25Eb3JTRnZZeStlUUdGdmpGc2RHRk1CeTB6R1dHZ3hVdGNpNllUNXZW?=
 =?utf-8?B?Lzd4TzQyaDZoUUZrTE0vODRLQzd1NWJQN3lCWW9iM0xSNVhpeTU3d1ZVUGRa?=
 =?utf-8?B?SzBoWUREVEFRQ1E5UnU0N0Q1Q0NjSjJvYXMrTlB3V09ORU5PUnJIZE4zdytX?=
 =?utf-8?B?MldLZXZJcWxwYVpjYUZJc0RwTlh6eTM5T0QrV0VJTEp1WElBWnJ6cWVlN2lF?=
 =?utf-8?B?Tk5WK1VTQmRMNnRmTnZEUkZ0a3BIaHpTUnQrcldlaDFUclBJLy9mZ2lUNGdS?=
 =?utf-8?B?N0JmQ0VXMERwNnRITlIweG5TTlZvc3ZjeFBmclE5dUo4Q2ZQK2dOVS9kSnNM?=
 =?utf-8?B?SHlqTE8yWWJZWEJ6dTF6ekowRWY3S1BBc0RJYUs0R1p0Q3hwdytCbWVLY3hy?=
 =?utf-8?B?dmZQdTZobTJVMFkrdGhnaHQ0d1BONDdONTVZdEx2ZzlISnJDcEgwYy8zdEx3?=
 =?utf-8?B?TTZPeEVhU05IbzZkUXk1Q0k0K2hSSFRBZXVTMUhFTTR1MFF5V0oxNUo4MW9H?=
 =?utf-8?Q?Ya4mrYmOSha+nNNepKFO9vusN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21eb668-c7f4-45ad-af4a-08dbaeb26f86
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 08:22:40.2507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYbbZODcepWPdYXwcHgWHKiayQqC+4AGxemgWS4BPm/BZXkVEz1L4yC/tj72/BBu9CDjFPsHK4I5X9Q6kJ6vLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9209

On 01.09.2023 06:57, Stewart Hildebrand wrote:
> Introduce a handler for the PCI status register, with ability to mask the
> capabilities bit. The status register contains reserved bits, read-only bits,
> and write-1-to-clear bits, so introduce bitmasks to handle these in vPCI. If a
> bit in the bitmask is set, then the special meaning applies:
> 
>   res_mask: read as zero, write ignore
>   ro_mask: read normal, write ignore
>   rw1c_mask: read normal, write 1 to clear

With the last one's name being descriptive of what the behavior is, would
it make sense to name the first one "raz_mask"? (Also a question to Roger
as the maintainer of this code.)

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -413,6 +413,18 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static uint32_t cf_check status_read(const struct pci_dev *pdev,
> +                                     unsigned int reg, void *data)
> +{
> +    struct vpci_header *header = data;
> +    uint32_t status = pci_conf_read16(pdev->sbdf, reg);
> +
> +    if ( header->mask_cap_list )
> +        status &= ~PCI_STATUS_CAP_LIST;
> +
> +    return status;
> +}

Do you actually need this function? Can't you ...

> @@ -544,6 +556,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    rc = vpci_add_register_mask(pdev->vpci, status_read, vpci_hw_write16,
> +                                PCI_STATUS, 2, header, PCI_STATUS_RESERVED_MASK,
> +                                PCI_STATUS_RO_MASK, PCI_STATUS_RW1C_MASK);

... conditionally OR in PCI_STATUS_CAP_LIST right here? Without
capabilities the CAP_LIST bit becomes kind of reserved anyway.

> @@ -424,9 +450,13 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>          uint32_t val;
>  
>          val = r->read(pdev, r->offset, r->private);
> +        val &= ~r->res_mask;
> +        val &= ~r->rw1c_mask;

Personally I'd fold these two lines into just one (and similarly below).

>          data = merge_result(val, data, size, offset);
>      }
>  
> +    data &= ~r->res_mask;
> +    data &= ~r->ro_mask;

This seems risky to me. I'd rather see the same value being written back
for r/o bits, just in case a device doesn't actually implement a bit as
mandated. For reserved flags it's less clear what's best, because in
principle they could also become rw1c once defined.

> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -66,6 +66,14 @@
>  #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
>  #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
>  #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
> +#define  PCI_STATUS_RESERVED_MASK	0x06

I'd recommend separating the "derived" constants by a blank line. I'd
further like to ask that you add two more padding zeros above.

> +#define  PCI_STATUS_RO_MASK (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT | \
> +    PCI_STATUS_CAP_LIST | PCI_STATUS_CAP_LIST | PCI_STATUS_66MHZ | \

CAP_LIST twice?

Jan

