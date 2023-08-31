Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3968A78ECD0
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 14:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593829.926937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbgW4-0002vV-42; Thu, 31 Aug 2023 12:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593829.926937; Thu, 31 Aug 2023 12:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbgW4-0002sn-0b; Thu, 31 Aug 2023 12:11:16 +0000
Received: by outflank-mailman (input) for mailman id 593829;
 Thu, 31 Aug 2023 12:11:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbgW2-0002sh-Lk
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 12:11:14 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe02::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79adddc8-47f7-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 14:11:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7918.eurprd04.prod.outlook.com (2603:10a6:102:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 12:11:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 12:11:09 +0000
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
X-Inumbo-ID: 79adddc8-47f7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TedzfK7cylfMXwXmXE03qS4rZh7uaZeDk6l3lmEUoA198BwkyHHWgs867oTKP7NDB5OQR+GYv2CaAmUhFkZHco6eBTQw55gyt0SzaeMKmnzDorJ3MvMO2/BheHcFR3Dqi0M6vr6Hcf/Zrwej5OH9EpesvsYdhIF6ZA0FZ1kqSmR7EZXvU0dDUidNz1YIiF7E7TWHSZG9FOslmvbUzvWzb139HvnXJ+Zk9KaWQCfKFd5YMakieX8opgzUosUkoAG1oOxAkUvZPyNSsfpPMPYwU6afxcWalXSJf24Wu09KxRYIT9tVs6sp1JaLmQ9DcHeK1a7taFwC/Tv5j9Og1vYrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOh2U8RvUCzStQPBMWxmcDvf9NNKY9DMoz/dy8/kWV8=;
 b=ac98ATNo/65cKF+0iokv3KpBtsTvIefl6bLuY0ExK/sN8g8V8HyT3xj9UkZGtpEnAIcitVsJV/h5pPay6cFm2vq3bGmf1IMZ7S/VzrYvwhcaNue7sLCHnxkMV75Fs7MDVtB0eZ/dwrWCA0X2VU9JJ1UUhm07m4ki3EiDOq2elCx5mrnr16/ePypcGzaYSo4TQyfxKIVu1a2N9823GAZdZ90Je0B+vPc/iaZ/BXiAbJgrIU9Nbn4LF/pXxMuB/DTLjpzSjaQ0Wb1hROP4/s5lFf39QCDnqpC52A8NqGAyaMbDTV+iM0GldtAUhgL548EwnhFARCg1xhu0F5iHqhvUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOh2U8RvUCzStQPBMWxmcDvf9NNKY9DMoz/dy8/kWV8=;
 b=zIvZfuzKp6hWaXOvC8O0B0TJ90+iv8DIOpeZ8QI4Y9PgSzJ6J8a8rzXn2+pN2IFDswLhRmXCIvcMzJbNdxoIHd+mm+IsoZ0t3x7s7tlxHfqp2PctGUG3Nt6J/TAFtDXSs3DhixDHHgpRY9Hjl/8KyzAWG5mpyNnV+91Ss+2z7NUXLU4wT9VJgX7y2IfpXOCv8uDVzc7uKVb7nNwCdRau14LPJBD11+qQcCZy3aWWEwnxTYMY+5dmnbcLy/z8zGYw7A1E9018K9E0IZ8i4MuAEe5cNp6eWNNG6OSu8w2K4PJ/PGoQZqHoOG7BmfHXJlhC9rG6t+kRbAbeI1fOq5/Asw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <059d3e2d-26f2-e24a-57fb-5ae10f6c2f5f@suse.com>
Date: Thu, 31 Aug 2023 14:11:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 6/6] xen/vpci: header: filter PCI capabilities
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
 <20230828175858.30780-7-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230828175858.30780-7-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5446c9-376c-4e53-553a-08dbaa1b5c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7atPScWyKrXnoW4lOD60l/+JC5h1oRIe+TcxaHDTlzDRan7GrUtksPVXMTiFX0Ahg74Qs2D6zH20D+PMI1GGxtsAm8zdjHDZJZ1wuJebnz6Ju1zxasdtyhN/z8wZmSbJmsBTxS1+6avZvhfIbHMf+c5K8qpWSd7LlRaOjInqMgsPfGkqdZPo6NItZ23eM9SxtXHpjfa2wA/vJBhGsmJttd8fDsvu43XyOMB8P/ailesNIghDVSwSUho48FqE9BYSarMo8vBeXTiEpDyPafqeGcKoT8l14YBnrceNCJ4e+tncHimcgEv7CEAeddHXthaEgb50uSlzX6ivZhlH1crVVf6U+havcbIb/2jf0rmFiIy7EW2q2httNRsGVxdex8i65jXsaz/eY9vjRV1arpfOiJhaq7jw6eM2ceICsTGckZavVxD90yEgz+ADYocbSmgzsOsh+u+g/Auldezl8ViljLPUVz/GAtQ9nuQGQFOehtMLDmdpwOMQfq7mUN0BW/26UKJqspU+teV5SDMhagJflZXW8s71E0Xa2mI/Tv1yNT0CShSOtunsgrhDM/NTCNLcNjxo9+Ue1BSYvmRnb/qgcep3nuErZWm93295eeCPZ4NUhZOhyYAEOCi2VuWDMMCnsy3pNSCw8bXFRBpObl9TZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(186009)(1800799009)(451199024)(6916009)(54906003)(316002)(66946007)(66476007)(66556008)(478600001)(38100700002)(2906002)(8936002)(41300700001)(86362001)(8676002)(31696002)(4326008)(53546011)(5660300002)(26005)(6666004)(6512007)(2616005)(6486002)(6506007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGZCNVp0RjNXemE2WW1TQlZ6M2QzZnJ1NXpkcGp4cEc4Yko2VElIbmhqNUFE?=
 =?utf-8?B?NVRQdHlybjlrME95SHRXUldYZjhlVEN1eS9ncVN5REZYSzNCMWJ2Q0Q2Mmpi?=
 =?utf-8?B?RE5lREQ1ejJ1dW5IekFJRXNpdGc0Mm53cHpEWStTMHRMQ1Bjbi91MmtrQmlm?=
 =?utf-8?B?MVFaS2JKTmZlbXdmZDlKTDhOcHlIL1dlZHVHbzZFUjNPRmtHMUlGdGk2czMw?=
 =?utf-8?B?U3M2RWJMK25ldGpSdFo5bTU0V1RQSlpSMTc3bjFmRlNRUkFwU3VJai8zWk1W?=
 =?utf-8?B?eFpha1lCTmxhampNQlVEY2tWRDNtRmhDWkd1bVovSVBrajFWQ1d1ZENyT01Z?=
 =?utf-8?B?NDM2c0h4NlJKZ2dSMnNFVWw5MXdFNHFZYUhrM3JQbk0vcmJTT2s3aXBOZ2Fh?=
 =?utf-8?B?eXV2Rmg2WWZqVHV5WnZNOHNoYUZOV3llTytYNjNyMXBYSW1HRFFJc3RJOFRN?=
 =?utf-8?B?RXhMQmN5aXZSWC9IUk56aEN3SEtKREtIRG9VMGY3dDNZNGxmc1phSmc1dDRy?=
 =?utf-8?B?cnV4NGxiOTRMOHdzUWV5QTdpUWw3Wk05SHYwKzNtOE11OWl3RENiTWtORXE3?=
 =?utf-8?B?N0tMb3lkV3ZtVlBRV1A5dXVzbFVMSjNjRzdUYVZwUXRtL1NsNWhmU3FmSGFH?=
 =?utf-8?B?MlBRNDMyd0VRV1pJNzhaYjlPOHlhbkkxeDhSS1FtVXRsMFdVRXhYaHJ3Qytw?=
 =?utf-8?B?TkxkbFlSRFc3TEZmL2lxVndlWmtjSUtLK2NranZ1Y09HZUNRTnpmQjVISkJ6?=
 =?utf-8?B?UnN3cXNLaFRpckJhbTNhSlk1bzkwbGRLY1ZzWWZWOFJHQVE3dm1iYTZpcnVE?=
 =?utf-8?B?ME1yVmUydlkxVkhRWSs4d0NUTmJvcEhpRitXN1RBSnNPa0dtTUdvTzkvNUU0?=
 =?utf-8?B?UkovNW5wWXVBeFJBVFFralpaUGdWTXZlS3J4ZmZUSTZQeXFLV09uVXd4cWlj?=
 =?utf-8?B?ejl4OGZpMkM0WkpqWCtOdHdJN01uVkxzL0FiNGpSaHdoOEYra2dsNVhUdzRz?=
 =?utf-8?B?OWMwRUZxTm1mT2lUSmZka1Q3Q2N2Y0NmWkdUZGkzbW5TY21PUE53cHJMUnZi?=
 =?utf-8?B?U2NWVjdXbnNxK2h1djllTHl6ckMzRzY0bEJKcUhocndBZ1dZem1keTJMaEtL?=
 =?utf-8?B?b0U5NjB3U0hNbUVJWFNMZGxLdnRvaVF1UCs5Tm5peU03VUhSb0RKeGV5cjVW?=
 =?utf-8?B?OEhYRDZKUUFrOHlnb0pObEtJQTg2aWthNHcyNGV3UW5YUU83V1VBeDFXdFp0?=
 =?utf-8?B?N2FBNXlMNEM0clpNcE1NRE9GV0d1RDc0MnBKT0krYzdqR05xRFh4dG5tREdi?=
 =?utf-8?B?QXRwRlZZWnJPcUhSVmdsTk1jU1AxeDk5ZmprN3lWMW9nYXZuVUZjTW91QnFz?=
 =?utf-8?B?cUNQSUR4ZnZGYzRQamIxazd2YzVmV1hzcFErQ1N6eWxhUWJNR0U5WHV4NWJj?=
 =?utf-8?B?ckhDY2J2Ym96QlRDQ0dCNVVqQklJTW5kZFltTDdxaHo3TnlOa2ZPZXl1bGlP?=
 =?utf-8?B?RjdEMS9EN0pRNjhyaDRkdkthUWZ0UTR4Lzl0UWIreFIveVpxeFd2QUUrT2Vk?=
 =?utf-8?B?RTcvZVB0Ym9NQTE5c25vY0NSREZvMmlKeVJoUXp5UUx2WE5IMkF1VVlnc05X?=
 =?utf-8?B?aWhRZU9uVDRrZmMxZWQ0VEJ0VE1NSjBmd0lhYVd5SUdrSVVLeUtTL1BZK0dN?=
 =?utf-8?B?Y3psTi9hQ0dNS3ZUbWsrYkcvZUt6U2lYYkJEUkpsL01sTkhqVjUwOER4cGpr?=
 =?utf-8?B?eWlrdWJZWnJ6dUErU1c1Y0pVTStOVmFFQTNzajk1VVE2ellacStudXY0TlQr?=
 =?utf-8?B?VGIyV21aak1wbVNMa2FwbGxZdmRuZG1WMDM2UmxvOGsyd1RxTVh2Z0JDdlNH?=
 =?utf-8?B?NmFFVUpZM1pZUUNGZ2sxUC9xYk50VFFtdk1lVEVEamIvY2NJdDN4dGRrMFVW?=
 =?utf-8?B?QU1kN2hTZE5kazFpdG1PdzN4d0Z2ZERSK29KOVF3TlpHWWtoY01RQ2hHamJx?=
 =?utf-8?B?M0p1cGZrT3Rzdzh5cXB4NmVhTGsrZG5QbGYrWWVKb0J2Mnh5T1ZnbzdnUjVI?=
 =?utf-8?B?M2xOaTFwNzdrTE16M1ByTGQ0N0N3Um82OTRFZ1RBcUwwSzBGZDFFSjhVZFZy?=
 =?utf-8?Q?GcHVozg7zQTTc9DXv6vQkbkzu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5446c9-376c-4e53-553a-08dbaa1b5c56
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 12:11:09.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bot+gtqMKyYDkETpaYTcYoDdvNtFfjNK+NcP/AM1OtVKl34AmVhLbLBAxr1F4FmRrnljPM0boY8jmZqUd3on+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7918

On 28.08.2023 19:56, Stewart Hildebrand wrote:
> Currently, Xen vPCI only supports virtualizing the MSI and MSI-X capabilities.
> Hide all other PCI capabilities (including extended capabilities) from domUs for
> now, even though there may be certain devices/drivers that depend on being able
> to discover certain capabilities.
> 
> We parse the physical PCI capabilities linked list and add vPCI register
> handlers for the next elements, inserting our own next value, thus presenting a
> modified linked list to the domU.
> 
> Introduce helper functions vpci_hw_read8 and vpci_read_val. The vpci_read_val
> helper function returns a fixed value, which may be used for RAZ registers, or
> registers whose value doesn't change.
> 
> Introduce pci_find_next_cap_ttl() helper while adapting the logic from
> pci_find_next_cap() to suit our needs, and implement the existing
> pci_find_next_cap() in terms of the new helper.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless a couple of remarks:

> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -39,31 +39,44 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
>      return 0;
>  }
>  
> -unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
> -                               unsigned int cap)
> +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
> +                                   bool (*is_match)(unsigned int, unsigned int),
> +                                   unsigned int userdata, unsigned int *ttl)
>  {
> -    u8 id;
> -    int ttl = 48;
> +    unsigned int id;
>  
> -    while ( ttl-- )
> +    while ( (*ttl)-- )
>      {
>          pos = pci_conf_read8(sbdf, pos);
>          if ( pos < 0x40 )
>              break;
>  
> -        pos &= ~3;
> -        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
> +        id = pci_conf_read8(sbdf, (pos & ~3) + PCI_CAP_LIST_ID);
>  
>          if ( id == 0xff )
>              break;
> -        if ( id == cap )
> +        if ( is_match(id, userdata) )
>              return pos;
>  
> -        pos += PCI_CAP_LIST_NEXT;
> +        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
>      }
> +
>      return 0;
>  }
>  
> +static bool cf_check is_cap_match(unsigned int id1, unsigned int id2)
> +{
> +    return id1 == id2;
> +}

Personally I would have preferred to get away without yet another hook
function here, by ...

> +unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
> +                               unsigned int cap)
> +{
> +    unsigned int ttl = 48;
> +
> +    return pci_find_next_cap_ttl(sbdf, pos, is_cap_match, cap, &ttl) & ~3;

... passing NULL here and then suitably handling the case in that
common helper.

> @@ -561,6 +573,71 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        if ( !(pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST) )
> +        {
> +            /* RAZ/WI */
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   PCI_CAPABILITY_LIST, 1, (void *)0);
> +            if ( rc )
> +                return rc;
> +        }
> +        else
> +        {
> +            /* Only expose capabilities to the guest that vPCI can handle. */
> +            uint8_t next;

If this was "unsigned long", ...

> +            unsigned int ttl = 48;
> +
> +            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
> +                                         vpci_cap_supported, 0, &ttl);
> +
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   PCI_CAPABILITY_LIST, 1,
> +                                   (void *)(uintptr_t)next);

... you'd avoid the need for the double cast here and again below. Yet
then I realize that Misra would take offence at us doing so ...

Jan

