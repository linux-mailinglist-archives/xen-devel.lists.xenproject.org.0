Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DAB49DCE5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261325.452343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0S9-0005TU-IB; Thu, 27 Jan 2022 08:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261325.452343; Thu, 27 Jan 2022 08:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0S9-0005QG-Ef; Thu, 27 Jan 2022 08:48:25 +0000
Received: by outflank-mailman (input) for mailman id 261325;
 Thu, 27 Jan 2022 08:48:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD0S7-0004wd-0M
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:48:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e16e4c47-7f4d-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:48:21 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-HsvK8GsgNV2n7a1dS3AbUw-1; Thu, 27 Jan 2022 09:48:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB9423.eurprd04.prod.outlook.com (2603:10a6:102:2b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:48:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 08:48:17 +0000
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
X-Inumbo-ID: e16e4c47-7f4d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643273301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSK5J8ggiUsZRw8UOO8CzM47LF2LNC3PhGAh/1xyCS8=;
	b=F8mUoSGCnY8WSYDx3fxjOxdBDBAx6cYas+3FrLPC/H3ly0KxYOVZ4dIPPueshOPeiN3J+D
	D+1dF3bCfsOcZ95a0tGxKXID1zZg7iXMJr5mAK4yz/Nv4df8ClX2TpVxZuJCOMWZcnVfYH
	Ldt2xu1ma/OqZoT66Gcd10u6WmThClA=
X-MC-Unique: HsvK8GsgNV2n7a1dS3AbUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzhJN9hcpQhXSa4lWGbLHrjZ7e7r+rkVu/scc12AOwNeVpBdJb6PvVJlmr4KQ/NbYK3dYODPcBFeWescjeUqHjWyuPDpyRZPPWuBdA/5Ri2OScCcIWp0KgKsw98mbmKg+ksqLcvBPg1hknV5lqzboqBJNHj/t1Yo2Hbfh+Y+JWG1eRQta20uZeVlzmr4PA7rlAHhBq+pSJ9+B2/3NkPo5dSRDak2I9k7PSMMImJa2cMlrWms59s0WNdY9HAd3/HqWsyDwddwuqlBORb+jaNFnnUas55cVy2YZQ+oEae9A4rbMOPMb3XPcjT+Y3AEeStbyezIVoEkP/rW1u/ffcQDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSK5J8ggiUsZRw8UOO8CzM47LF2LNC3PhGAh/1xyCS8=;
 b=P/wSXI0QaV52j8QFfNeM+JuYsVx2bO2/x0q07y9ilALmv3BbqTu7wTZlsL3LywIv7WMrcM8L2w4vDYbgi+ASFr3TS7fEgXzwLMB6dUZvRJGygRKR71rwoK6LVva4r5uVTffXTAiq/HiZVfL/yxQA3v0YF+Ywd9Ul0z5PI7hVn9NI2m8OxCALhjdMu1o0LB8qOY+UAUhpmDzW0wAvPTxrvAi1k4mBPNefLhhtH+xdmTSuzFWyrUDpDNIc4/59slgv1N+eUSWosvPyJRbmuSbygUazI1Do7rOfpjbOUryaX6yOp0gre5H7OAv6kbylf6XQ4MqYbsgvTCyGpMbVi+Oi8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a82bfdf-479d-3813-069a-84d30a6e29fd@suse.com>
Date: Thu, 27 Jan 2022 09:48:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] xen/pci: detect when BARs are not suitably positioned
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220127082218.57902-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220127082218.57902-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0041.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08c93be5-8513-47d7-f6bb-08d9e171c396
X-MS-TrafficTypeDiagnostic: PAXPR04MB9423:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB9423C25B65608391BA43E8AFB3219@PAXPR04MB9423.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r2u2Zb0LQ9thnouaoGqTT2gB+x5KL2alj+tIiy4oCJ/TpD3SzN6syZfvIKs1yx94Fhv/Ih5Suv1OCKgCHKODJFkn+NGq7pyqmwdQOm0QMCuIGFJaI3lwjXHk1Bq4mUJWgMndjD5lRcg6HKNO6KRlMPJV+GiQ7Zw0oG4AemdIhSbo2iX+6/wRr6qdB73/nWzEWMbRQoC478twB4f5FmBNde+nyjO8XCBdzDL5yUidCec98plfYA2icsbnh1lyeDc0/eqMT/GPX2VurUPkt/gvc+ECEyvsnaHwyXsWiEYCTgCENo4mjI04XcQFxkgSGUGWK4vqxhEaA4KUUyMoj9HzixIHcAVp/Ogv+LwX/b15u9eQFsYczTJVKWkE7aWIFonQ8ZmBvVRd1nJk6OGckeGmPzb6bMWJkPbmMD9Zxu+MoP7+SR7ba9Z2VxoHjWDjk3czMjgE/bvMg4bqNWYC4UoBrGSiTmKk1P3x4GNLEBxOCYcAHYZ2cQoiXT/M/ICyGxKPcKrT19JG6sOpk0Megs/MjM9B1scoW9slMZnVayWfM4dOULI0GmET+1xHj15gjQnf58ZM3xDdamtbZFu3VpKZX0UGFbMi8da73Ahc0/meXa8ckAxwQt/zYjR9/HWWuxIAeuWxxfNIi4UcZ398/EmvLSQ18m6thIq6ViHUEqcWOVaa1psnKrsf8iZX8tc73Y2K/tsRB8w5H+mX69XDbT0Kf3giIjHttxhchFSux36HCVlEmWOMt31IiEs5MRq6xBfm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(38100700002)(2906002)(83380400001)(186003)(26005)(66556008)(4326008)(8676002)(5660300002)(8936002)(66476007)(66946007)(6486002)(31686004)(36756003)(86362001)(316002)(31696002)(6916009)(54906003)(6506007)(7416002)(53546011)(6512007)(508600001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0w0blgzM3dOTDVvVVJDelc3MktuRXY0TmNLL3I2VHN6b1NwSFN0TGhZcVN6?=
 =?utf-8?B?SkNJcDkvZjJqcnhxekoxQUl4UjRKUjNrNW5UaXZCQVRhM0VEWHFwUmxUcFRW?=
 =?utf-8?B?RjVza1FQaTdxN2RDeVRuTnpIREZCNkV1L1NUUUZWaDBFRzZ4djJxWVhsalNh?=
 =?utf-8?B?TWR6S0kxUjJvRXVFbTBucnNEa1Q0cW0vNUFSR3ZjNERLZisyTUdsNmZ5bnYx?=
 =?utf-8?B?Z3FZREtDK1g3bDdBMkdmWjdmdXlJRU5ib2VPT1JWVTNNQ3FtUFF4UFhMYlBQ?=
 =?utf-8?B?akZRZ2gwWGRyRmNBc0JiM05vMHRMRkpTbXhodmNIZ0haU3dhRXBOdkpSZzMv?=
 =?utf-8?B?V2dpNlJKZUpPZTZLRzFZS0RlNmd3K0szR0M3ZmMxWVpvRDJaZVVlTXhPSzJu?=
 =?utf-8?B?cFNIUkZIcFlnalhFRWYzV1V0YkdLZk9TenU2MVZhTnduLzhZZ3pSMWVWbU8y?=
 =?utf-8?B?dlNSeEREeXFldzAzcDMweG5jbEdaR3BVakM5dFZNZXZLOWdvZ2ZPMFpuL1FQ?=
 =?utf-8?B?R3BYa2NKSXp5N1BUb1NzbXBheW41Rk1XREk5ZHk1Tml4WGIxZGJvTFloQ1l6?=
 =?utf-8?B?amE5eEk5Tlh5OE51V1FsbGo1MXJpeGVaTFhmK0grNGJ2VkRncEtvbFJLWFBO?=
 =?utf-8?B?dUdxYTVRS3Rud2ViU21jN3lkc3U5Q2JEWUZvM3lTZE9NRWpOUEUwMTlNdkh1?=
 =?utf-8?B?c3lFVnhHcFhkeWlkM29mQ2U1cU5YTGpkWC9hd2V4QzZUN2h3U2dBdkJnaFhq?=
 =?utf-8?B?SlpMNXp1V2JBQU5PUXJZZ0h6Uzc5aHdiVjlWUytvaXV1WEswUEJFV3dVRSs3?=
 =?utf-8?B?a2NZcjliTXkzeGEyL2lPMG5IQTVST2VjRk9wVnRleUtmL3BpQkJ5Q2dCK3FI?=
 =?utf-8?B?eGRnMFU4YlYyYWNsT2RVcWxBK0pkUGJOdWpDUlg5Zk9wQms4KzI1eSs0OTRj?=
 =?utf-8?B?MU5HaFBFdWZnNGZhNk1NREhXam0zTmpNRWs3clpzVmFKaTdMdU53YTNkU3gx?=
 =?utf-8?B?Q0tOaFNVT0VtUVJqTWJHWjRESE0zSFI1cmJnb0pXNlo5NDJVdXhaNDhUOWJv?=
 =?utf-8?B?WklIbFNueHY2YXc3dktmdHI4ZWpTeE5IK3Z6NytiQlVxTmVkbUtsUTlUaWEr?=
 =?utf-8?B?UG03czVNbCtzbmN5cENCbW5IUEE3czJVTms3dTZITzQzM3NNRWR0cjRqRTFk?=
 =?utf-8?B?QzdHM3hycFIyYjBIN01CV3JsbjJKZnVVeS9MQVlXeHp3Wmhvc01ReHE1d2pN?=
 =?utf-8?B?c0w2ZG1JbS85OS9yWlZmVndFYVRNNHpPNCt3S3Q2cllaTFhNanZwVnQxMCtI?=
 =?utf-8?B?ZjZUSGpRTldZV3dGWUdvRjJQUFJ3K1owRkprd2lwY1pnY3VQdTN4d3FRU2JQ?=
 =?utf-8?B?VisyTGNDcmNzdnBqMFJjZUhld1J6cm8yNTVZY1NZVWN2MCtRM0JnREZ5akpk?=
 =?utf-8?B?N1lldDh4YTNQK3F2bHdoVFRTK0liNzJPWGF3OHpNRnp3dzVUaDc0Q3lhRzRD?=
 =?utf-8?B?WnhHQXZ5RklPcThpSVdOWTRnWjFwSzF4VlNIMXF0M1lOVXdVUlBQWEp0L1pJ?=
 =?utf-8?B?RU1vRjBVVVJKZDI0RXpCUFlxYlc0US9RS3hrU0tTbGNHWG43YWltQm5LMkll?=
 =?utf-8?B?YUh6V1F5UXd2T09nUXVIN0ZnbkVQSmVySSttQUpZMkdiTFpjSXA2ZjNhbzNn?=
 =?utf-8?B?RldzZHBZTTYwbUtvSUhLdDFXb3JDeDFNQjBQT0V4dUQwMzhJRFNzTHRrWHFi?=
 =?utf-8?B?TXhSN2NIZVZqZDB6T0hDZW1MRkpxalVsa0pVNW56Y0lPTWlsbXNkN0NVMHpM?=
 =?utf-8?B?Sy9wWFRsSzZrZS9HZThOMXRWMWxGRTl3ZW53eFZPcTIxenQ1NVRrU2o0TDR6?=
 =?utf-8?B?MG9YMStrdlU5eW9BZ256WWVSSXNaWmpFSFZsTFkrVExZTjRabncvZGJYMCtI?=
 =?utf-8?B?Qk1WOUkyd3RNZXA4WFdvWklxRGQ2TDREdnlUekRQSEcwOGlDejFZR2pScE9M?=
 =?utf-8?B?QXFSOHZnWXpnNWxraEdpOTdSTXRrQWptcEpCMmROK0RWdGVPZ2RLNTJYMDRT?=
 =?utf-8?B?ZnJmWmErSU1KMTQrekhFa1lmdVpmeTlEWkV4aDZUdDJXNUpZQ1RuRjZmZWhl?=
 =?utf-8?B?MUloT2VlM0lpU1NjWDVOUlJDTklhTHlFN3hqN0ZCWGFoN3RRRUY1a1RBQVlw?=
 =?utf-8?Q?oFFJyzYbAMVNEav2cxerMU0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c93be5-8513-47d7-f6bb-08d9e171c396
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:48:17.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJN+NehkO7+e/tR8vB2mus+z8IDs7rECR7UQI19fca4r9oQuUPkN32wG6SMIg3+lPFXJKl7s6ZliPUUKGfUwuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9423

On 27.01.2022 09:22, Roger Pau Monne wrote:
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1625,6 +1625,17 @@ bool is_iomem_page(mfn_t mfn)
>      return !mfn_valid(mfn);
>  }
>  
> +bool is_iomem_range(paddr_t start, uint64_t size)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < PFN_UP(size); i++ )
> +        if ( !is_iomem_page(_mfn(PFN_DOWN(start) + i)) )
> +            return false;
> +
> +    return true;
> +}

I'm afraid you can't very well call this non-RFC as long as this doesn't
scale. Or if you're building on this still being dead code on Arm, then
some kind of "fixme" annotation would be needed here (or the function be
omitted altogether, for Arm folks to sort out before they actually start
selecting the HAS_PCI Kconfig setting).

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
>      return (page_get_owner(page) == dom_io);
>  }
>  
> +bool is_iomem_range(paddr_t start, uint64_t size)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < e820.nr_map; i++ )
> +    {
> +        const struct e820entry *entry = &e820.map[i];
> +
> +        /* Do not allow overlaps with any memory range. */
> +        if ( start < entry->addr + entry->size &&
> +             entry->addr < start + size )
> +            return false;
> +    }
> +
> +    return true;
> +}

I should have realized (and pointed out) earlier that with the type
check dropped the function name no longer represents what the
function does. It now really is unsuitable for about anything other
that the checking of BARs.

> @@ -267,11 +270,75 @@ static void check_pdev(const struct pci_dev *pdev)
>          }
>          break;
>  
> +    case PCI_HEADER_TYPE_NORMAL:
> +        nbars = PCI_HEADER_NORMAL_NR_BARS;
> +        rom_pos = PCI_ROM_ADDRESS;
> +        break;
> +
>      case PCI_HEADER_TYPE_CARDBUS:
>          /* TODO */
>          break;
>      }
>  #undef PCI_STATUS_CHECK
> +
> +    /* Check if BARs overlap with other memory regions. */
> +    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> +    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
> +        return;
> +
> +    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
> +    for ( i = 0; i < nbars; )
> +    {
> +        uint64_t addr, size;
> +        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
> +        int rc = 1;
> +
> +        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
> +             PCI_BASE_ADDRESS_SPACE_MEMORY )
> +            goto next;
> +
> +        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
> +                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
> +        if ( rc < 0 )
> +            /* Unable to size, better leave memory decoding disabled. */
> +            return;
> +        if ( size && !is_iomem_range(addr, size) )
> +        {
> +            /*
> +             * Return without enabling memory decoding if BAR position is not
> +             * in IO suitable memory. Let the hardware domain re-position the
> +             * BAR.
> +             */
> +            printk(XENLOG_WARNING
> +"%pp disabled: BAR%u [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n",

I guess despite its length this still wants indenting properly. Maybe
you could fold this and ...

> +                   &pdev->sbdf, i, addr, addr + size);
> +            return;
> +        }
> +
> + next:
> +        ASSERT(rc > 0);
> +        i += rc;
> +    }
> +
> +    if ( rom_pos &&
> +         (pci_conf_read32(pdev->sbdf, rom_pos) & PCI_ROM_ADDRESS_ENABLE) )
> +    {
> +        uint64_t addr, size;
> +        int rc = pci_size_mem_bar(pdev->sbdf, rom_pos, &addr, &size,
> +                                  PCI_BAR_ROM);
> +
> +        if ( rc < 0 )
> +            return;
> +        if ( size && !is_iomem_range(addr, size) )
> +        {
> +            printk(XENLOG_WARNING
> +"%pp disabled: ROM BAR [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n",

.. this into

    static const char warn[] =
        "%pp disabled: %sBAR [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n";

to limit indentation and redundancy at the same time? Could then also
be re-used later for the SR-IOV BAR check.

Jan


