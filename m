Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA425823F1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 12:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376018.608584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGe4J-0007uU-A9; Wed, 27 Jul 2022 10:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376018.608584; Wed, 27 Jul 2022 10:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGe4J-0007rH-6k; Wed, 27 Jul 2022 10:15:07 +0000
Received: by outflank-mailman (input) for mailman id 376018;
 Wed, 27 Jul 2022 10:15:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGe4I-0007rB-ML
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 10:15:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbca2848-0d94-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 12:15:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5716.eurprd04.prod.outlook.com (2603:10a6:208:128::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 10:15:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 10:15:02 +0000
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
X-Inumbo-ID: fbca2848-0d94-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwuctuR748CPoWeAkQR37So0HkDskZ1xqTbsRyQiVb6uka/y5J6lsZYFsEg5Qw4MN9LoZVo5ZS2bDfIIIjOuBkLjpMqd5uk3Vz7DPwQviyDlU7vVITbkvXLKwCSP5tP48Kt9Dv1NmsSAAfJpg9VxXEZQ6krHpCXFUN8goRFV5txiiS0Np7gtPfsoNmoVAT9Aw23dV4zwKQ8tHps1ZczgvVow/7C6q7sx/dRQYQoU/cZS/dAf0v8Rld8s/5wFt0gjeXy70uSJFLMnavf855c8qQL6E6S5tnVI0cPfElFM5jfEsgkJ+pgZR4jBhObAL3sNRYFD5oaWNsfHK2c1bc7ODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fI5OjZMBjxRFOx5Eo+MCYD+WJsXwTXC2IsyNyarfdbA=;
 b=SE7iKzRAX/qDU7O+uFNTZMvPJHsJS8vCp/uZrj54xXLmDeZQ8pg21QvUveq0D25lS2TXjUjaYu8PWmv+FW8wX+khOhF0xfu2AKH6XEq+/T/3U2zXdcaUlHDQrrlJZNHvwfKkuQufBv3ym9wOh2rTKk6FZTW+RkN/17heAOy/y8oRasQ+sol347w1wcb+EBW4NaR1OOsqtWV6qzXAzeOVrv+fW9NYaVMzx9qd+6aX6ced6Pmv6/jA3IH6gyOQcARFjkRWpoTCWss7cUcejHtS+QidQEXM7A5XjCchFanYo54TtjO+cN7LHmIqMwYa+XGHYG/5LjWI7/yIcJZ+gJIpdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fI5OjZMBjxRFOx5Eo+MCYD+WJsXwTXC2IsyNyarfdbA=;
 b=3H8taOF8/XFqEHcA4q/OEI/bmy3aofrcgUXM1B7A2cp++KkiYkb0D7O6qFfYDQPulIkGFWhTG0nSxs77d98rvLS2Q7eVvpwyGKrHQp8n7pP3mbvrjSGQlFuXH+uC8iE584wwLa8SLlA9ln3y0Ww/gGhFJnniB330tu2cwY7JTDE2St5p8pKtTe33wwK4+biXqPqk58PdiTltofiZ6y397jtS7MxadGDSJdMWTSn6diRAlTFOQBzjGV8C+qaMm7pWLhOgxLyQPlMpd0jnCC3eFv8AHBgvxzzSoYm7l6j1Tz4T2IeCRFhNM8O78iL18dHvckh8eT/okLDlGQWMtuj6aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfc1adb6-82ac-5afc-0d4d-4514548314e1@suse.com>
Date: Wed, 27 Jul 2022 12:15:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 03/11] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-4-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220719174253.541965-4-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62b50083-3ae0-464c-6113-08da6fb8de94
X-MS-TrafficTypeDiagnostic: AM0PR04MB5716:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fMEqkJ0IpyhPRawHywDrystpu8DC8w0P39kCcHL6AqqV7OvfLcsTBDDepYV6AgqoNGBEqVg6YvbjMMiqxMvlDi5XTwbLDBAaR8Z1iL7NHb8GURlirnu+vsQsfgsgD7o7PkO5SLsjIQtU2srli/zcySZKtKQ55waCeVsMsAvCbobbDpHpx1Lb5WJVjQFdk7N/3Bn6bWx0f58sCaIJUOTXEFZNN7r3w95lOAqDyGxuvSpDlxAc1k+cVq99SecqjeAdmumpcwBI09l9BHv8jGqcbg4KbpDZ79pPTLphVSjc9j2/xr2TxUTYHsd/OSerkublDqksfu5ka/i6lXNnip4cepY2AKuAIkJCvBm5z0b1MJZPoJ435RdMk/0hHivMamot2iD/LqiSITMGKbhSZTQVD/FOLpvv0pcKCOE19cksgaJSp70+uU5YgLcZHjwAm+iKLKpAZ3hn4H6Hb05+5yp08JS51NNIbGtnA8vZQkp8jOI1sTphP6k1eGBt6fS5GeFnnh6HI/gNzXS4EtGKrx2I9+23bK7N6URBl9OVW7NYEmrOVWLi4atxCtcTiAT4yTIJbqldZeNBQ86tM6uhisa8XG0WwwL+L0LKyonwR1KgyQHljMI+oDuNxdmR1xmHNTiXbEVbaKLvTdlsX9NQMfSbeAQhrXoOMpNVkVRjX/Ol8lvRCT20lySflz1Ov7je6NN8Is991BVwB8GACBu0b0V2l0SdpPZyS6Hokg4EoXVQasrWox+XLbAau5QzvhxPAIXks1m45Ok/4mBkB/UyuGey5b2r3P634rNBIwnHcMNPNRIQ8DQmYq6eS+n523SUX/WOKmhwz5L1aJN3+u8nYIM/Pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(396003)(39860400002)(366004)(6512007)(31686004)(36756003)(186003)(316002)(31696002)(86362001)(6506007)(4326008)(66476007)(66556008)(8676002)(66946007)(5660300002)(2906002)(53546011)(478600001)(6486002)(54906003)(8936002)(26005)(2616005)(6916009)(38100700002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDlZcnVNRnpOeHV2OVNSMzUwcTBST2M4NEdMYTEyYWF1NXlLOFJtZnBYOUlZ?=
 =?utf-8?B?Wm96STZQdWlhd09kVkwzSWhMM0x5RW1GaGQ4em10T3JRenNPRVNTbnBpM3NF?=
 =?utf-8?B?RVBnck9VUzJhNDBENkhzSHQxUy9vOVVtMlVMSmxqaHFaRit2bVBOcWlZdWxa?=
 =?utf-8?B?NWJMTzdGQkplQjdibU5hQS9senF0cEhlUjdibDAxTGlNZjB5di9wS1FUNGI5?=
 =?utf-8?B?b2prUlE1L2gyendNbnFJTlI4ZVVXM1RxS3NPWVJRNXNrcVh5RGtkdVBXUzVW?=
 =?utf-8?B?ODFiTSt3Tm9iZ0hvTzJGblpGdXYwR3BTa3ZqQnNtbklPWks2MFB3aTZxdkJt?=
 =?utf-8?B?VG9LQjhhbklseVhnd09jZXNHcG5meDJEYUQ0dlpMNUNpYUsrT05ZNnM0akZS?=
 =?utf-8?B?QzNkUndlT2phd2taRlB1Zkh2Z2NDRFdESjQ1RE9CbFZPSnN0UUplVEY0aTds?=
 =?utf-8?B?YjR6T3ZmYjQwQUlTbG43UEJsRlpZelFiNHZyYURpT0k5ejRTVkZIbE8wUWg2?=
 =?utf-8?B?emt6cW9aZ3pIaFBvamZtMGp0K09mOE43c3BZa2tZcmZQbldJa3FKSWE2clYx?=
 =?utf-8?B?MzRWUEpWbUw3cW5NYThhbnJjQkpJN09HNmJjL3BtbU1sN3hYWm9hVzFScHFz?=
 =?utf-8?B?YUJmeWFjRUt1VDJtN2szelFhTUdzalh2ZnhKNzBWYXZueDd3dktWamRjQW02?=
 =?utf-8?B?Q0d2Vmh5SVVPNVVUQVVRakdvNit1bHpVZnJsYWZOdEFmYitzVmNTYTU0a0lI?=
 =?utf-8?B?ODJaUmZXNUtMY3hKRnlRN2hRaDlWc05vVndSTEZZVUhQdGZlMi9XWHZGcjhK?=
 =?utf-8?B?bUlhNG5kVnFTV3ltMEo2bThWY1VlVWhOOUpYQUsxZ2ljQzdCdmdJOE91WDRk?=
 =?utf-8?B?OW01UXBxd1dVRTVSbUdwSjc5dnRDYkZ1NCttUVgwd3gybHYrM1hJMjdYZjRs?=
 =?utf-8?B?c0FiVTAwZ2VQU3djd2srMlJvQmFVQ2JpQXMvd0orLzJJTnR1NDgwYUdGeEFz?=
 =?utf-8?B?TlY2M0FYMDh5MHNHSzBBWTBMUVZ0TWdNU203UExXTDVwVHNnLy9hTmE5QSsz?=
 =?utf-8?B?V1lBNktxTmZpWGdVcTM0cmxjL3hPbGlMOFpCYkRLNFdnQklKcUJoK1hobHZN?=
 =?utf-8?B?Y1NiMS83YllWY1VBWnRKa2o4aHJJMzdXb0o2azd0Rm55aGJUVGxxOXBobzBp?=
 =?utf-8?B?VHRQMjlaR2YwT1ppL09oTVU0eml5R293cUlqTi9wQkExYlRvdkZOd25sTEtj?=
 =?utf-8?B?SGpJdWMxV2hoc3ZqQ21JRmw2T0ZySzFabENSUVZmWFptUEVrdDU0aklFei9h?=
 =?utf-8?B?YXBRMlVTWUJBK2s1clp6bDFpSVBDV1poVkhYaW52VjBpT1dBN1k0dHVWUVNO?=
 =?utf-8?B?dXVqcG15QTR0cjB2TjJyLzNFZVBxTHZ4REZXaytjNExJUlUrYWFIVGVxNllT?=
 =?utf-8?B?dHJKM25UWFBIU085UUdPT3M2WkRHRGtFKytKaFBBYWw5emN0elBtUVQwN0JZ?=
 =?utf-8?B?cDBDTHFNaFpHZWlRNWp3a2lTdUhybFlLbXdaMTdwdHVVN3hJbW9vV1o5Y2pM?=
 =?utf-8?B?Zm5TNFRuTG5pN3RKbE1weG1qYlNXN2h3UnZOY1ZtSUo1dDFoM2tYQ2ZnZUVR?=
 =?utf-8?B?RUpGVVlUYkFZVU9sMWtjV3hwSlEzUnNyU21VSVNnRFB3OXYvQ3hHd1VMNnJi?=
 =?utf-8?B?ZWp6eFF2WHFZNDg3WWE0UDdiZGU5WWo0azRRQzU3UWdmWWNjNCtlNHRVZGFq?=
 =?utf-8?B?Q0FCNE9QSnhsN1l4bk9QQjZiNjkwYWFENFR5Ny8rQU5QZnZKTDVBRTdaVlI2?=
 =?utf-8?B?WUJHRCs1UFB1RHE4Zmt3MmRQM3IvNENLZWFJNENWTU43L3pOYlVWNzMyMFpV?=
 =?utf-8?B?b2h6NzI5Mms2UlJMemNlNUNMV0toQXl1VHNTTUNHRmIxeGVNWEZzTU56NWVk?=
 =?utf-8?B?d0dlT1hjcXl0bEJlTExFeUxKQmVQWnJSSFRCUjRsck81RzV3Z0FDdldIWTh2?=
 =?utf-8?B?a0UzM2ZKbExEcDl3VXc3NlBEd3pFUG1YQ1dzdW1sNXV0NFRNckFMeWRnODE5?=
 =?utf-8?B?UUc1YTdVeGoxbmcwWGNzbkZ1WHRGcUpGTFhycm9OV1dQQjhUUExvUEdGTW1B?=
 =?utf-8?Q?rLq70DTWHtXimCwW+XXMuxFTP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b50083-3ae0-464c-6113-08da6fb8de94
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 10:15:02.6371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXgH68XHNpONZ2MN3t6pgGfTsXZ+Zea8vSG43BxSR//ayLKJHSJcAuMYn3s4eQX3BS7ivM6/5aLpUx7n/3hN4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5716

On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
> @@ -527,6 +592,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>          {
>              bars[i].type = VPCI_BAR_IO;
> +
> +#ifndef CONFIG_X86
> +            if ( !is_hwdom )
> +            {
> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                                       reg, 4, &bars[i]);
> +                if ( rc )
> +                    goto fail;
> +            }
> +#endif

Since long term this can't be correct, it wants a TODO comment put next
to it.

> @@ -553,34 +635,47 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> -                               &bars[i]);
> +        rc = vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                               is_hwdom ? bar_write : guest_bar_write,
> +                               reg, 4, &bars[i]);
>          if ( rc )
> -        {
> -            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> -            return rc;
> -        }
> +            goto fail;
>      }
>  
> -    /* Check expansion ROM. */
> -    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
> -    if ( rc > 0 && size )
> +    /* Check expansion ROM: we do not handle ROM for guests. */
> +    if ( is_hwdom )

This again can't be right long-term. Personally I'd prefer if the code
was (largely) left as is, with adjustments (with suitable TODO comments)
made on a much smaller scope only. But I'm not the maintainer of this
code - Roger may have a different view on this.

Jan

