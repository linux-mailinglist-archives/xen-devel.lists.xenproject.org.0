Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F1D71FDA8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543028.847587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50zh-0004bb-FB; Fri, 02 Jun 2023 09:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543028.847587; Fri, 02 Jun 2023 09:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50zh-0004ZF-CR; Fri, 02 Jun 2023 09:22:49 +0000
Received: by outflank-mailman (input) for mailman id 543028;
 Fri, 02 Jun 2023 09:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q50zf-0004Z2-SN
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:22:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0891b969-0127-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 11:22:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7469.eurprd04.prod.outlook.com (2603:10a6:800:1b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 09:22:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 09:22:42 +0000
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
X-Inumbo-ID: 0891b969-0127-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8gaeO3m8rdflYYarNNbpKwaEfIvfjgzO1danDZtPd+UDW2U86Ehz9zdvHwLYgxiE43gEja1RyqH0R6/XhhQse35oMLvfIIJpvfJ8dyQqxAmLerU3ovv31hEkKaaCh/UxuMUxwNOGcsK5MnIkuPrd4snzfUMg77cr26GbImPtuy4MKzL2v6tkNnRzIuGT6OZa9m68z1tTWU+CSyPstIukFqI4HZk7TOSKijCsLqTSuDSAoxLph4ZlQWSYhEv+xyH0TGgL2FrgvO98edXhMs0xdedmxNAhgLiNC6JaLpFo+7XxPa0e59qKrZB9oDTNBZjbpf4wolP7L04WwoK6kPptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sz3cIfM+RxhbSvoJSZ1fP1qiiqRjWDYZWsj6/2Cdyg=;
 b=E33jmVGIn57im88Zvv1lIQU/CLlj4ZQUP5WRGROyXWCqeVJb3DIZAb4FremtMQKX0mOyzT1MbyKXYZNcp/ToQ0AON52tm3ktgE0xahMqwdHT+O18RP1xSkU6dvgjNJqqaISj0jmDn7nzjjZfkhLaFfXZjzLX8FuldHfmU29gmdvw87tG6Zv/zk+xLCaDif5I0WtZzge/N82wvEXBR0v5/If9y1dcGoKEgUC1WDa6IPJmTLF/cqZPcN0sohf+jx25F62hlMSSRTJdZ0aSbmVYuNWRS1f9Q/AV5tlnF65jNoMmyPflvG9r/NszNtWjN0GnL8RYOYNgmsbVT4iwTO6E9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sz3cIfM+RxhbSvoJSZ1fP1qiiqRjWDYZWsj6/2Cdyg=;
 b=bYR2alP34prfGZPodMEPSfOBQ9rrrKqXVGdTsXbRD57PJiNYkoj15MSr6dOlHsk/FArFjopAqmSEh/NvZoVtfRH7fmFu64WrynINQiAjyJXU7VyY3ArCROOj8JkgHCnfBITdzQqNRXdU+QGMPDqbyHL55kPyKIGM+qnuMMAhERZVRVW4guV1agXKQChBxeUtSaeZF6ay0WKScnOuuXt+WE/VdMhKF2pkdAJU4pKscl77uea73K6J86CeK7PW4G7ZkQihdyNiUxijVPML0m/OveUeLMnfDZDdfHYSn6H8GICK5jsWSfqGF33f8tnSA21w+J2CZaKZgkVZ/pYSaybEmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36bb69f2-14fb-3517-1bf3-0441bd4058dc@suse.com>
Date: Fri, 2 Jun 2023 11:22:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 11/19] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-12-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230602004824.20731-12-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad5486f-385a-4fe4-49e3-08db634aeb13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dc5JyyssJ4Bw6sllUEfLfsvwTVnRgMop95XcLAnQJ94iYHUL9EIn7D8BLuA63365e7mGZO+OK1KK68g/TMtvHSXsJAcP2PaP/xKA94YFozwhY4ctXfNBzqs5GRYQ4MO8SMK3IO20NjeDjcAskB0YW2VPzHZdZwk6G1jJ6JQmkNt71ybDnzRJLLzaAEFDjvAxLh7EWazz13gr9weNTRQKMMkcTS6lOkZBERhObIICxeOrum4xtcu4UlZekq/R/G7wGRUw4WIkZZgUW//mDODjZuIGY25Qq54M6LIrp3ObUydnrkj4QnqeeEL9xHVZ65x5zts3ji0yfRo7oAEO5qPfzxF6Oex6mUwVSTnEDnevU2y/WFkPpWxYaQ0e4WwWhKNCSNvKgg0ht/IsRhT2yBSUPiteZ2f29hwjra7UmT80mLwzBDT/OnQngF7oC77A0ilT1rtSgeUkmmWAI+C3PdbYi1mxSHOKojcTFdUt8J45THkaStdzKZajxoj3ahAkzspPaL01bV2T6MlnStJRoqthWErlJbayaaGUxLi5CHzxIhf1jNj9lR6L1x5jbziIqApxsslYytQfHyYFf1W9fdglKXX+Fu9WgQ3CaPFGd4dp8wYBKogDbr1dsWYEQeONPz9yioFCpVTr4yhyBlqpsF+Uqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(54906003)(478600001)(41300700001)(316002)(5660300002)(4326008)(66476007)(31686004)(66946007)(6916009)(66556008)(26005)(6506007)(6512007)(53546011)(6486002)(8936002)(8676002)(186003)(2906002)(2616005)(83380400001)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG1WS1NSeEdIbVZTa1I5OWhYU1lOVXgzWk5ySlFFaVRKK1BMMTlsazdTM2pL?=
 =?utf-8?B?VjdLcWNHaFVGYkV0RWkzR3BoVmJWbUhNY0ZYNWtoSGFXVGwvK1ZSamRRRDNu?=
 =?utf-8?B?U1NPb1loY1djS3JFSXdLYzN1bjR5NnZ4QUQvaUFNdHNKZURwU21tOVI5dTYv?=
 =?utf-8?B?OXdBTTJOSGd6a01oalNNeTM5Z0pld2I2OUJRdzBBZXk2UWtsZ0lpMXgvU2hG?=
 =?utf-8?B?d21ERGdHbW1pbGlVTlUwdlRpeXBYcU1pcWtPZFM0TERXYm9JY1ZNcS83eCtF?=
 =?utf-8?B?Q2RMeGhPNk9FSjR6RXVqWFZrb3BhOVo1c3BDdkN2eFlIQ0I3UkJObFRKMmIy?=
 =?utf-8?B?azhyWkNPQ3RRVnVjOHNoU2I0aDlRTmMwcUJpd0FMN0RYM0pYdVBHQ2tET2Fu?=
 =?utf-8?B?cDZLR2ZvSjZzOU55cGptWlNLc2p4Ri9iYXZJS0VzbE9IMk5BV1UzUTN6bEJv?=
 =?utf-8?B?c29yWkZXN2pYVjU1NDBsSy81MEtlUnZpalRMT0FCZ2FmM1NFblpMZUdOT0F5?=
 =?utf-8?B?SFNCUWRmalRiWldQdFNrZktmejFWSmpSNUgyUDBJTCtRODNEMCs2L2w3UWVX?=
 =?utf-8?B?b0w2cEIraGFXVVVkeUJoWFpzRXZXZm1vN0xJOWtGS3RKd3FoTVZIL3lrOThQ?=
 =?utf-8?B?MVMyOC9VS1lCYXZVL1ZMRFQvaVkzYkp3U0hnNmRka1pSbVBMVkJITTJZbzJY?=
 =?utf-8?B?YlN2anBoQm9VSEMzNVl1bjhzZEV1ajA2RzFpRWd6VDJZVVhIdkp4Y2hBQ0dW?=
 =?utf-8?B?Lzk5SUk0ZUl2SGtBZkNOdjAzSnRIMUlVaWxGVXlWRElnVyt1ZGZwZUMycFpV?=
 =?utf-8?B?YUhtK0JVT0tMdFN2aEJUa3JubmJRbmFEanJhNGplZUtZQUVIOEEyVVFINE96?=
 =?utf-8?B?OTNQeUNMOTNoVEMwb2hVV2lVQVdha1NFYnFreWUxbFlISzYwWFgwS2R2TUlR?=
 =?utf-8?B?bHh2ZENEdFV3cG1GWXplWlZXQkpUaTd3OGh4eEVmNmhTb1g3SE14TTZsdFpX?=
 =?utf-8?B?WHVBc0ExRzVLUkc3NlBDNDU1TWl5a05kbXNCVlVDb3RiVXRCWURGVElIRjRL?=
 =?utf-8?B?cmU2R3N6b3NtM1NwRGg3b09zbVFJeEVyTW5ZTkNXOXRjMjl1NzE0RERWV0Iz?=
 =?utf-8?B?WjVFUURHajFkdXpmYnQxZUo3K05wbzBRVXAvenJVZ1J2Vjl4VlF5K2dYV1dC?=
 =?utf-8?B?MXJ2bmFrVk9mUlBCUk1HaVJhVlgrOWVGa0U0TzM4SEVvVzRFYXJEUUs3Sjh5?=
 =?utf-8?B?SURCVXAxekd2Y2FNRG44V2dZTVhvem9BVjc1bFB6c1BXUVMwTFlYbUNNN2lo?=
 =?utf-8?B?alc0c0dPUFlIaHVURGV4L2dVOFlRTDVmU3BxdTdLTjQ5ZFQrODJ2RmtudE9q?=
 =?utf-8?B?bHJtZitkQnAyYkIyUkVJT1Y2OG5uYUx3ZG12bUxhMHRQQWdkS25KamwyaWxF?=
 =?utf-8?B?dmpqL3JuQUFxaFA5VVdmWnlCcERVNmYwNXJvK0d2alBHQ0srZVhpOVZpaHFy?=
 =?utf-8?B?ZmxCaC8xdmcwOWpFRDFoWnpWNFZmN01OczhZKzZ3aW1HT2cwd05GeU5ZejR0?=
 =?utf-8?B?clM2KzdMQk0xd0hFRXBTazdsMEJhUE1qZWVJMDZORHdzSHhEZ3FiNlFqTk9Q?=
 =?utf-8?B?dG5GVTBjcFZDYWJzaTZYVDYyUWZZYjh3cHV6Z2pkQ0NnOUc1bzZFdjg1YS83?=
 =?utf-8?B?ZHhuL2pMUEVUaDVLNFhmVXU4NWt2WnpFMnFxRUN0UHJ1My9URmZrRkNURTEz?=
 =?utf-8?B?bTFuN2JGcGZuNCtDcFlUbnk0eW41cFZ2eUxYVDJtb3huSFJDUXBUREZjd2tW?=
 =?utf-8?B?WnBjYytXbHVId0tQTm43RnBWVjFaczZZVVp1U01hVVdCNVN5NGZYam5yMFpX?=
 =?utf-8?B?aVo2Ni9qMDRVUngxOFZZcjh1ZmxacmVpbFFNTzgvTEtuako3OWcybm4yOUlM?=
 =?utf-8?B?QWVQZGVGQ2VTdllib0VBcU5XNS9OWW5Ea090emsyTHZKMjM3V2phTkkvUDIv?=
 =?utf-8?B?amRYRzg1bDlrbVRkbVpXYkZiWXpHckd3djdpN2xTRzcwYmZNT1RURlRnT3lQ?=
 =?utf-8?B?TVFXMFpNYko1Rkh0eWJwdFhacnpnN1B2cnAwbVJVdXFpYnNuR0Fod3g0Vzh6?=
 =?utf-8?Q?UkKlj74AwsAS4+AS7xezw95/7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad5486f-385a-4fe4-49e3-08db634aeb13
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:22:42.7517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tvUcT4IN6wImzthDV8uVyboEjLWtpfiaR4/qfvmkOrauusmq0b9HvPs4htmu+R+wZYiViIlL57k/Yg5KdZcXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7469

On 02.06.2023 02:48, Vikram Garhwal wrote:
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -126,6 +126,47 @@ int iommu_release_dt_devices(struct domain *d)
>      return 0;
>  }
>  
> +int iommu_remove_dt_device(struct dt_device_node *np)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct device *dev = dt_to_dev(np);
> +    int rc;
> +
> +    if ( !ops )
> +        return -EOPNOTSUPP;
> +
> +    spin_lock(&dtdevs_lock);
> +
> +    if ( iommu_dt_device_is_assigned_locked(np) )
> +    {
> +        rc = -EBUSY;
> +        goto fail;
> +    }
> +
> +    /*
> +     * The driver which supports generic IOMMU DT bindings must have this
> +     * callback implemented.
> +     */
> +    if ( !ops->remove_device )
> +    {
> +        rc = -EOPNOTSUPP;
> +        goto fail;
> +    }
> +
> +    /*
> +     * Remove master device from the IOMMU if latter is present and available.
> +     * The driver is responsible for removing is_protected flag.
> +     */
> +    rc = ops->remove_device(0, dev);
> +
> +    if ( !rc )
> +        iommu_fwspec_free(dev);
> +
> +fail:
> +    spin_unlock(&dtdevs_lock);
> +    return rc;

Same remark regarding label indentation - please address throughout the
series.

Jan

