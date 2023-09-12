Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D11179CC02
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600130.935734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzq0-0008LW-Mf; Tue, 12 Sep 2023 09:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600130.935734; Tue, 12 Sep 2023 09:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzq0-0008Jq-Jv; Tue, 12 Sep 2023 09:37:40 +0000
Received: by outflank-mailman (input) for mailman id 600130;
 Tue, 12 Sep 2023 09:37:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfzpz-0008Jk-PU
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:37:39 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01e141d3-5150-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 11:37:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9841.eurprd04.prod.outlook.com (2603:10a6:10:4ec::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 09:37:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 09:37:34 +0000
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
X-Inumbo-ID: 01e141d3-5150-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6MLdxT3+izsy+6JNxbjyulRBoRW7mJSFycLI9w9FHxR2ZQE74jVkLgSww2jWpwLz5cxr2hX7KXaXT0BV2P2fczAWazlnXOa7W24b9YyTV9QnxVvJswEF/PgSaEZUUyp1HWIjivvbP4nNlOZgPvVbkwL+GSf2Kbk5AMNfSXxoK/xeCPdI3TRANatEkJDaO3W44KHKXCQ8UpQBHhPE5mLkcUeq9OrP8x9SwJwxBXXyIheElEfa826SQNqrpkXxUxTDRESjLslkyAUE21dzh58gTfrst9fomFfz3sMwd+ZlFaWmxSFE1fa+1r/V2hYsyE4CeBEPLmJtgm8JVPuTsan9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSI3v53eU1/YqOJpOLURXahaxJrjt5HtgzTGd1ZERvI=;
 b=b9L1vfnrayVbBeziZncslkHkxqNRirVxt7itMBFth/Q894Q8xT/savwVp4prb/yh+ri3hK+Bm9iL+kuFjI8den7AeRRQZ77PmyJ23J0VypmOotgPfZBL8T5zpuZoY7fA4oswbnWZNB2WSfdP6fWQ2oiRQnhPJ5WHv3qNmQ/Sh3xrYgFUv/ryB4Wl2HyAbro1LKJh9xuleh4pWvxhssFXMRc301I7XiwOgyfhpOaOWUuYhW/nQ8zbAiTrmzEAyUJQOMaxMscqX+FcKSxxQOlSrkfqsr67k0OMj8tK+/1LcEVDYa2DmvtRUW8Lzct1P4Rr3jUJ7nnhteNgKHCrRAKVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSI3v53eU1/YqOJpOLURXahaxJrjt5HtgzTGd1ZERvI=;
 b=3yAxYtu8YTHjL1svI1pN/t3mMoDRIIggVpn1t+pWMcipT4LENmHlKWWrv+EBc9FZ9zh5FTu5Py9N8B2EMAmj7JHUYV2Ep+WmQ3hVzwrVieMN+Fvlb1B5uSzDltZZCZYHDl+pLdm1HlJAC0oynZcyk9xJiesn3eg9IniDjQCZ4JFdddLiv7eEvGp0XbG5JpJ4XCNVkAJWfRqYRxPr+zu+xfOKdq6DcDa7/H8MLPiMOja0no0f0wOdZImU4LXqbBePSX9RJ+XpLWUKQeQb+/Ndt9WpjBMkVUfvWhd+CBUQev78Aamk6ri16XUTR1je08UiFqM+cWSY7HZ1J6vt5xYrJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77e2dbc0-c224-4c1e-72a0-5b19aa76ba0b@suse.com>
Date: Tue, 12 Sep 2023 11:37:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-5-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230829231912.4091958-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9841:EE_
X-MS-Office365-Filtering-Correlation-Id: af6e9681-8dee-44ab-7453-08dbb373e454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sonPpDQnpq6YRL/kTNpXvQGlimKIvIGj1a4yP/MAfsIVQCMZAy/n8hq7TW8jQ0TelJ3tb/lxo0le3XRGUPkpv2DvFPdjQ7Kdx/iEyW6pDl7ZzpTirHED3GyHjInMuoZoiMOnbQvAL9H4FYjq/0o5LR9cHcKSKxi6AHYD7PHOF4zoTbF8/aysYX4/lp5gUW4WiVcU6otJUFVTcgdV+m0MYYRLxuHQFo7QBjZFS2Q/9vpkf65CtrYUFjanmCYZBjxa1LQqJ9j5pACuemXaBzifutgFOsw/GZtLFJk5ov5CKxe+BtuSH2RZTwyMImQgPP82CgzNxPB57wTUYROC4lYTfyTewdgpDTxhuP+egldJ8MAvYOJzciQxV/96UA4cqOmbV30Efb2CwmT22Y9WXev2xrj2xmax4fN0R5C/ZZQiFI1oDA+lJvMDFtFl5DnVWvCaoLG8B2cGtG+xYAUZnPKL2XSTX2nYMpRRelTDOSM4cqB26Fr+XjLqBAlImq2+elTgtjCCy8H+v0Hf24M3B10aek+wF+Cp+lQ/Iba38todEWJh04D9QBl3iOKCNDTzRxdLomC2wawZkUB7bpic/pKNxHT/EDB7VijP+6Uh+rpZ/PIlpHG1VCWJOcYBqL3aE8iC4obNkYzsZT/lIeoZXUND5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(396003)(366004)(346002)(186009)(451199024)(1800799009)(316002)(6916009)(66556008)(66476007)(54906003)(41300700001)(66946007)(478600001)(38100700002)(7416002)(4744005)(86362001)(36756003)(31696002)(2906002)(5660300002)(4326008)(8676002)(8936002)(31686004)(26005)(2616005)(83380400001)(6486002)(6506007)(53546011)(6512007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0l1L1VkNnBoc2hFNjBjdDR3RzZCclRFaGIva1d6b3JVaHpkU3ovZjVDbjE4?=
 =?utf-8?B?S2dXdFZqQnZrblpIQlUxUktpRHdxMUY2ZXFOYSs0YzhaaDU3RmdJeWRjUEpk?=
 =?utf-8?B?REF1U3Uzd0R6aWs1ZHRYcXhPWUkzREkvVWJxT3gxSXB5T3dYOTJKUFluNUdn?=
 =?utf-8?B?akdrMmNRU1VhamtKNTRtUUVVT281VEd1dDBmRzJoRlYwdVlXbElBajNrbjhI?=
 =?utf-8?B?LzB5Wmc3MUErb1NsYnpxdiszT1JnWUQxVGd2TzJsY2x6SUtnOE16MUlTcGQ3?=
 =?utf-8?B?dzRjYWN5eEFGeXAvVk94dnFyZHNyUVFQWjgzWk01NXgreWpMN3lTMEdSODJj?=
 =?utf-8?B?eEl1aEtHWGFLN2dFQk1XMDlvdEFzZkpMVzJqMVpBZklSWWVmNGNZN3czRGZa?=
 =?utf-8?B?V3hFZVVuMXJ6UHdNSjAreU4vY3I1RldJU2hTbjkwOHh5Vyt0RGpCRGFPM2I3?=
 =?utf-8?B?STV5QWZPQ2xiUlhjWGh2eHhJanZMZDFZM3hPZnEvNFM4cFg4Z2VDa3RGcUhl?=
 =?utf-8?B?R0ZWazNzM0pvOUxOYlRqNUgwRmtKMGVmdW54aGRDeW90eldjWmNSbFFvUVBh?=
 =?utf-8?B?cEErcEZleSttbGl6NDd6ZVJ6M25uWGFBZSs1VmFtZ1ZvUE5wTnJ5QWlaNDY1?=
 =?utf-8?B?azluLzNoaWEzeXQrUHM5Z0Q3dGlxbkNOWitNVmg3WWtnYzFOb3JGQW50aU85?=
 =?utf-8?B?MVppSEt4d3BzMVhhV09JS3NCbllHTzBpQnhhbys2cU42UGNmZFhac1k5aUox?=
 =?utf-8?B?S0F4VEFoREZMSHdmMzVNeWVzaDVvM3ZySjRnSjhReXhnQzQyQkxDdzMzTVFy?=
 =?utf-8?B?YVVIZm1XY0JBcWxnWmlSTGUzQ3c0MmN4VXBpaGlaTG02aEdwR0NFbmlOUzhK?=
 =?utf-8?B?bmRwMWZ4UUplaWMrdzZBd2s1RWJMb1JNVlFPWGZUTXR4Q2dnMzY0eUhTdzA2?=
 =?utf-8?B?b3lFQnBzbTZVZ1dMcG1rM0xLNDdsQmpGTkRvQjF0bndFcFlTR2JaQWFQR2Iw?=
 =?utf-8?B?bGQvQjVaY1FsSUVLNnRqSGUzbWVzM1c1K3NDT0pBTGxqOVFva3JXUG9sY3JT?=
 =?utf-8?B?bWlySWQ2RlN3cTU3Rmp0UTZQSkMzeUh1YVExY2l4MGh2VFE2dThWdituQWl1?=
 =?utf-8?B?WHdiNTVGbHI2Uk9QdElEME9mcHg0ZS9kekZIOVVKUU1CLzd0VDNGeUZia1c4?=
 =?utf-8?B?VS9YMXJ6SHBDQTY0ZlBhVlNEdUFYd2luMG01UHJiNDhSbGFSQkRLYVdFNUV3?=
 =?utf-8?B?ZGNEbEFzQTVaNSt2alh6dnFxcERhV3hWR3Q4SVU3NFg5MDh0S3pNbFpZMnQw?=
 =?utf-8?B?RmpsaHBmSDk5TXQ5Z3grQmdXQnNmZEk2MExEM1FwczBwNkZESmpxczN6ancz?=
 =?utf-8?B?bUUyZkVKYVJzUnhrdVdMM3cxclhJaWlkQTFuZklTVDFab1MvWEZNTEJpb3lq?=
 =?utf-8?B?NjJOSytQME1BaXluWERST1N4MG1LTE5vOWYrUC9KaWtFMzVjcVh1QTdoSDF6?=
 =?utf-8?B?L2ZiK25lVTNFOHJpbzR5eXl1SWZRRGFWcHRVWGFQblFpQWk4VEEwUGh4YUxK?=
 =?utf-8?B?ZGJxY0cySGhULzBsSklBaG5XZ1d3Y1NWR1dYcEhRRTBoN1dKdHpjdnNoQzF0?=
 =?utf-8?B?bWVOdS9SOEhnVEFVUUVnbk95em56U1g5WmNHRGFWR3hobnByZExpWFJCQW1C?=
 =?utf-8?B?MzRybWRhaGtWV3FObHR3MHp3U051R1JrckhaNjJ5SllTYXE5R1NxaFNxTWh3?=
 =?utf-8?B?bkdXaHVvbTFhb1ZoRUk0cVA0cnhEcUxRNGhualJvQmdIb1EzSCtSczRiY1pE?=
 =?utf-8?B?VnZ2d0l3L20rMGhFRDZNWTVGZEFWeDd2enFycGtmNnFxUUwvRVVWeW9SSnZP?=
 =?utf-8?B?bWhURzFvL0JzYjFUOHlTYmpFUWpJeGJaTGJHbm1Ib2ZCM3NyajM1QjRJbG1q?=
 =?utf-8?B?cEN3MTVJSnRaNDlRNzQxd3h6bEIvRVh6d2plcHJxUlVidXk0bEsyS1R1MGlM?=
 =?utf-8?B?MFo0UzAvRjRVY1g2RVFZbmVhZ0xCV3BzeTNIWFhvU25JSzJtNjdGaHR0NTlo?=
 =?utf-8?B?Mkt4ODc3Q3NzYnYreFIxYzNsQVFyN3hNUUdSWHU2OFNmUnRGM2lUcGxjN1dG?=
 =?utf-8?Q?d0MKantvdq52uon7NxJDc+jlz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6e9681-8dee-44ab-7453-08dbb373e454
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 09:37:33.8124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLVTOSkwcxhT507lR7abEMUiFQ5NXNMFtCvnLT/8n0GyqEouyJLrkUfpudvfSuvTw3kNhSN+h19acQ2jwZpdFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9841

On 30.08.2023 01:19, Volodymyr Babchuk wrote:
> @@ -1481,6 +1488,13 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      if ( pdev->broken && d != hardware_domain && d != dom_io )
>          goto done;
>  
> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
> +    {
> +        write_lock(&pdev->domain->pci_lock);
> +        vpci_deassign_device(pdev);
> +        write_unlock(&pdev->domain->pci_lock);
> +    }

Why is the DomIO special case ...

> @@ -1506,6 +1520,15 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>          rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
>                          pci_to_dev(pdev), flag);
>      }
> +    if ( rc )
> +        goto done;
> +
> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) && d != dom_io)
> +    {
> +        write_lock(&d->pci_lock);
> +        rc = vpci_assign_device(pdev);
> +        write_unlock(&d->pci_lock);
> +    }

... relevant only here?

Jan

