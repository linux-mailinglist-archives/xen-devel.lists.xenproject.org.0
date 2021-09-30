Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3241D5CC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 10:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199628.353807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrp2-0002U9-Tw; Thu, 30 Sep 2021 08:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199628.353807; Thu, 30 Sep 2021 08:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrp2-0002Ru-Pq; Thu, 30 Sep 2021 08:53:44 +0000
Received: by outflank-mailman (input) for mailman id 199628;
 Thu, 30 Sep 2021 08:53:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVrp1-0002Rm-Fv
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 08:53:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2432c45-d303-48b4-865b-76e5d0e5ae86;
 Thu, 30 Sep 2021 08:53:42 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-TdokWeptML2htBxx0mBZKg-1; Thu, 30 Sep 2021 10:53:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6381.eurprd04.prod.outlook.com (2603:10a6:803:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 08:53:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 08:53:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0053.eurprd02.prod.outlook.com (2603:10a6:20b:3a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 08:53:37 +0000
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
X-Inumbo-ID: f2432c45-d303-48b4-865b-76e5d0e5ae86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632992021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyNj+9vlrP3omPgt6HOQRriQEpOzh8GdSwwftm6nJhU=;
	b=mooQVmHKSfu1KvUV6uy5kv05Wp0LpoiY3TEbNUdGRKUyG8gBdycTVKfvE4JvljbbV7YjgJ
	oGywom2xW9reDiZbKjCZ/AF0gNPUhUc1BzmzSrt1k/b08KHlBu7iQ1m9YzqqDxtCAW41rf
	v0EcUsHUE41zOKQrXMn3twutgfiky00=
X-MC-Unique: TdokWeptML2htBxx0mBZKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNlT0UQvroZjdVOpoJt19sNdL00DA+np9Xq3EKTa3wF4YoJWNZOSFQ+1wtNSfJyau/ncpHwfazJUhaU/GvhklxmzQwoIhxZQFmToGTQvJtPIIGKekFqT1zWKLDDfXO75zSfX0eNZlOQMbT2Zzj7CtrYH3KUVnktNOG9CGPmYAEKeTvDsuORFf/TYBgQn83o5pSoXwksCRqnkTb5GhEuEi/6yrqEACIUWZ127l/ZuRdA6Ft2LQ9g872p8xpnBonoXlnItDyq4mzv+xCz7S7m63BIV0+sxRdW31qP4RhSL4dELKrdo5Ph8tNDkYWF1xa75l/4SfvhipNxwYU6eO+ff1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gyNj+9vlrP3omPgt6HOQRriQEpOzh8GdSwwftm6nJhU=;
 b=RESUDXTrN/m068UYN7iVuDwSDQYfG62O1iCeU5PwDhH8YbdkBZRDP5rRwE4kmC98EPqCSX8EbgOopCFxk8AyMeQM7L28kI0wJPvq0IpAljPeBsfbExIi+Le2rw+U03YtblqsUeGvVYHa3Ys8YOA5OPzVsbJygW1GjtzQ3G4StlctB+XZ5rUnnaZjTS7/Zyww1EdD1ltOOWz0W1PRkfeh9a1dWjWMK5RFbVQKXelQdZO5GNtt8lhawoHbyQ3u7YuUZcoUBolurwjyYdSOQ/d9rVnriovM/QfSeLw9NPv3rkdBlAivQsMG62yMldVHSHb1AQgv58VkZhmAL22ZUwsGjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bbf1de4-75cf-4f67-a96b-52762332d220@suse.com>
Date: Thu, 30 Sep 2021 10:53:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930075223.860329-12-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0053.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1921f54-d526-47a1-4b7d-08d983efcb29
X-MS-TrafficTypeDiagnostic: VE1PR04MB6381:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6381A419ED6B7483994E5973B3AA9@VE1PR04MB6381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tOIn7zBtRwHdAHC2K+stQWueE+WovUYW03effl1eHG3wpZeGLS7rp2wXkPqbFg3qWIAQUTAcvgzu+lhwYJTFnGyvpHx5oU5rNXFnyVsXeKn44RQ1d45g6qRQHO2UwxZuj9F2ttvejS3K9DDcAQuOpCmpVekJ2HYPWNdA1+kwmsIseFKo6eGmKATyoLPT5OjPZvPn0zci6rukzibQlg4mvXUHQIxNBJID4hmmwDUZaH4JJjP3ThicdaMqC6+DCzFPM+lsik9NptoTpQCMwfjMZYsNg6m5ZCRuEQ13OcKKQSVmhe5HF2kp2OpjTyJ/9JlMQBQ1sgtG/8qt7zSom7Sg2Qp5G1joCt8yxJDt+PCJjLsTFLv825+H6N/f1wsy5b1LLUMsQiyFIFZcZc1fYsHbmm1r3avr5DOv/9oNWh6jZ7ecexrfAodW9sP3BTkGwT3aZmwQc8K8dWwPQPMEYutDUzEi66QCNCOd3FGk3gtZskCw2ZoiWSRECLmb5pDcKGi4g6Nk0g63AfPRBCyNWOa1lFvVp35ZBS0Jwc4glBBe8+kxgJitVmsfyaHguMIwqGABQPIR6ITIBr+EwMv3FXMqPW6osE2uy1n2vMKlytGNCWgzsKVKkdwM55rBSYumqo7Mxbi48oMGa7zsjIf6ydxDlzLf91HHSIXf5gBIeXFStxlaaGFMCerTONQC1qZaIfRwfGzNISEodcsiHn/dFbN4tYt6e3a5JOSWxpN0bBPVP3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(6486002)(8936002)(31686004)(53546011)(508600001)(26005)(16576012)(31696002)(8676002)(66556008)(66476007)(66946007)(316002)(7416002)(4326008)(956004)(2906002)(83380400001)(4744005)(2616005)(38100700002)(36756003)(186003)(5660300002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0lkeTZNNE1QZ1lWaWdqYmRZM0tVOTdBbFNMK2pYaGFwZVdGMjRPY3lyS25C?=
 =?utf-8?B?SjZtb0d3M2UxWjZoZXhRVG16ZUhrYlpmdVd1elB2QXVNQ0FmWldzcE9DTkVu?=
 =?utf-8?B?MEtJOVFDUHg2dWNjQWpZMGJRaDVoL25QWVNQT05vSXFpUHFhbzJOMDlSR0F5?=
 =?utf-8?B?MlVLRTI3Rm45NHFBNnV4eEFBUERCVEtLUTIwZjZXSm1zTHd1NnZTdVhXUmhk?=
 =?utf-8?B?OHE0d2hoT3lTb3grN053YlJncHBkNytLbU5ZNWZFWmR0NWR5b0ZBenQxMlBJ?=
 =?utf-8?B?QzBkcUFCMmQ4UlQrc2NNd2RPbXZ1RDJmV0VabVRiMGJqNVBmNXB2QUJYcUlq?=
 =?utf-8?B?SlVaSjdRdlgya0VWNk1iV0RtQzBtY0hjZEtYQTJHcllQUGdpT1E0aXkyb2Nm?=
 =?utf-8?B?VnExekYxQ0syLzQ4UVpjR1hCUGN4c3ZZT3pxdUdWQXQ5blVUaURiY25XWDBO?=
 =?utf-8?B?b1ZnaTVHUVZVVnN4UERML3hKdVZXbTVBM1VjaWxTZEtXVWhYcWI4a1lmU2ZD?=
 =?utf-8?B?OGhBMU41OTJ1dXROYytjUkV4NzZ5U25neFRCR1dzMjhWNGdtWUNzR2RFd0hI?=
 =?utf-8?B?RXdDY0F1b0xNUG5TMk9NSTdaYVZISzkwc3N3elBMa1JDdkhOYlovNEJTZDVL?=
 =?utf-8?B?ZWZseGtGOGNNcGVFNlhlU055N2Z2VUJ5dXg2WWRoTE5BVWZnVXlpb2RGaG1O?=
 =?utf-8?B?Y3lwNEFCUlBvMXFNRytNSnhXNkZmTkp6RHVGQ1VYUHZDVWd2WHdsb0g1TU4z?=
 =?utf-8?B?M2crRUNtejQ2bjZ0SXJIZEFKcmlIeUZYU0V1OFJ1WmtZaGxNVzVWQWtSdkxJ?=
 =?utf-8?B?K1RndUhXMjBnSzFPV1JJM0gyVGM0TEVkMmpnZk85bGdhS2s2V1FvWFljWStr?=
 =?utf-8?B?NHRLVUMvWGF3bjZBR0ZSU2RwTmJPUFdaMkhzWWFTajkwQ0xVczJ1VnEzUWhZ?=
 =?utf-8?B?SXVjZDVXOW5XS04xbDBMbjZZNHZ5WFV6Q01LMHhpZW1zZ3dHUDVxWFNRK2Nu?=
 =?utf-8?B?OUsxdXM5ZENxcUg3TnNRbTRjcTZRWkltR0JQYnM4UFZRSE53NnAycy9QLzR3?=
 =?utf-8?B?M2tydGJxZE5lcGkyb0VzNldzVlAwVi9WYXJGNHdKTHh4QjZvYVZFa2s4OS9r?=
 =?utf-8?B?d0ZxdXFQNzV2RFlCdkk0TG5WWXlxSytHQks2ck9DZnFSejNSWE1zaTYxclBx?=
 =?utf-8?B?VGtoYXFnc3NTTXdUOFhwYXJheTdHYlpIVzVCS2c3YmhEcmJwUHBxR0xXZGJH?=
 =?utf-8?B?ZHNiOHRGK05vN2ZiTzZCeE5sMDBpSEtpcndKQ2VoTTNlQzFCa05MT01XZmhw?=
 =?utf-8?B?NlRyWlRkaDZxd3c0dUZZYStQUjdpV3BHR1VQNDlWRFludVRwQVhua1hTRW8r?=
 =?utf-8?B?bHZEaEM2SE13TjlSRjltMXhBTmEyd0w0L05RUGpTQlZFVXpmaEVoR1p2Kzdn?=
 =?utf-8?B?R3J5RTBhRTUveGg3Y0NWRDBZWkJ1U212RVl1clIzNzZTMHJtVzJHQ3JzYVE5?=
 =?utf-8?B?azdWV0NyZWM3NjZKc05PbkJYWExuMUc3aFpFa0w5dnI3aVh6Mm4wVldkcVdB?=
 =?utf-8?B?UWE1eFRKZjhNaXpXRm9qc2ExYnNkSlZ5SUFzS2NDbXRTWU1GdEdpbi8zS2sx?=
 =?utf-8?B?d2J5dUk5SjVDeDZUd21JSDI2dEZNQUFhbjZ5WnVmc3FBWUVLNEdFR2tmYk5E?=
 =?utf-8?B?NlVUT0NVMUp6Y1FrTTlieWVBWXUzMnIrTVZnTFBFc3g5NC9uNnpES0RIUzFC?=
 =?utf-8?Q?EoxhmybKhc9lI1cw8XWrV2bsPfIBgA7OZpyH7w2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1921f54-d526-47a1-4b7d-08d983efcb29
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 08:53:37.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+eV9h1i6ed9ALzEk8CYLk00uDdZN2MTXrr1OnvMuAF9gUU8cHxO/RFks65TWeg4BzS/wzzYPO0ZtoLanTBGLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381

On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -889,6 +889,31 @@ int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
>      xfree(vdev);
>      return 0;
>  }
> +
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool pci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    struct vpci_dev *vdev;

const (afaict)

> +    bool found = false;
> +
> +    pcidevs_lock();
> +    list_for_each_entry ( vdev, &d->vdev_list, list )
> +    {
> +        if ( vdev->sbdf.sbdf == sbdf->sbdf )
> +        {
> +            /* Replace virtual SBDF with the physical one. */
> +            *sbdf = vdev->pdev->sbdf;
> +            found = true;
> +            break;
> +        }
> +    }
> +    pcidevs_unlock();

As per the comments on the earlier patch, locking as well as placement
may need reconsidering.

Jan


