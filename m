Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C170D434
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 08:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538241.838060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1LlP-0003SD-Lo; Tue, 23 May 2023 06:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538241.838060; Tue, 23 May 2023 06:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1LlP-0003Pm-FU; Tue, 23 May 2023 06:44:55 +0000
Received: by outflank-mailman (input) for mailman id 538241;
 Tue, 23 May 2023 06:44:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1LlN-0003Ou-Iu
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 06:44:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51fddd55-f935-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 08:44:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9845.eurprd04.prod.outlook.com (2603:10a6:10:4d8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 06:44:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 06:44:50 +0000
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
X-Inumbo-ID: 51fddd55-f935-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9gyp684BYbVazTITUAfKCkDTUmIIHAsNWqjsStL8CotHG6X7OA9/q83an8bmmt/xakqhu+igwfSsUu4J+c3H6UiPH5kcv72BojyFLQuOYA7Vx8vFKiPdg9C05sr78XEUwfS7GUeOCkMck5Sr3vQ2dMpoglWe0u7itNy2R5YR+8g5SPgh0IPVUydCFOgrSi8v8v7f5QEK8X/AIQZNPECIMWt52cI+WElRQdlJv/gCZjN2bVr/iY/RXA/mpfgi/7dkCTelFazdLYDq/e+GFvRB56lC3MwxNB2KFPtoxwXIcz9R5DQsbe6sF2z+MSCMVmoZw0ssvMSZ/G55AOUZEWJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWZsBUOoGQA/pMRklxQ169OlO1xKU6Cin6kSzQzHTbQ=;
 b=nm7drmM/2dXBzu7XZB13nPIkA7Fy10r6prf/bygVMBt3EOUIqTRLwAJeTASyo1CrFXhz0DLz7G/0mYCgq1Kdbm1D5ZqNKg1xBq3vc91G7mCT4PCeXKcQjbB4JZoLTaiZr2aFvopA9AXuZoumu7CBwX2xKbexCX4IV3mlLJaoafOOpqUzyp/DfNXU4oiDNgDFtnAl7vjDqCZxrDk0AkMMBh+SHTcxH40Bgn7qUk3OARxxPrA/tTjOUiyt25zZYWgU48oaggcS3JTwlRn6b9aa5aqre9myY9U8eVcntiYy/LETrdJOvVapVmtB8gzw5ZIBTwKQYTidu9Fu5ArCx43Hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWZsBUOoGQA/pMRklxQ169OlO1xKU6Cin6kSzQzHTbQ=;
 b=fP3hui/D0avZedW7TbR7HAN2SlLBgv+w8KR7amDhZcAbK0YdKrnXUQK4UXenTaZn9Djisi9QtVXReO/OnDgo04TeynmGW0AJK4hpUX4/fJj8UrmBTsWoduu/+Fr3/el4LzZbUORKYP2IobYeuIPUqiLSLLLu3oNUq6cLCX5kfMdV6mXLBGYRbcaj31pSwSAuEB8XidWGJccjvtcRhCc1x38tQKchEVn+tFH1EZSdNktKQfCh5gXoMs2TPlPO/+7NsEnVmVVuS1lMvqlioXZbBRppG0E2FmBTKgVPfGaueHnS8oM2k0cBvNhHfWgq9M4QAXtWhrMwrcJ/io63h2TC9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <818859a6-883a-81c0-1222-84c62ada3200@suse.com>
Date: Tue, 23 May 2023 08:44:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: PVH Dom0 related UART failure
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 marmarek@invisiblethingslab.com, xenia.ragiadakou@amd.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
 <ZGcu7EWW1cuNjwDA@Air-de-Roger>
 <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
 <ZGig68UTddfEwR6P@Air-de-Roger>
 <alpine.DEB.2.22.394.2305221520350.1553709@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305221520350.1553709@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9845:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ddad58-6c14-4e55-a537-08db5b5934fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kw6GlkHE08dOmFDDbn4fE+S1nKmCAvoGKxoEm6PqaWcE26L5dJQv4CWbsfsujC82iYAhDOJnp6YCOVsYu/ElRVXxtnt5RaZJkj4A82usLCTUx6M77jLImOBByWrBdb3bkYarCpnPzTr4Dw5dqHFzut78ioqM95QKOOVyLmIUl7cVRKbHKcvII11dQFfypUZHdekAbRckdYiS4ZKNPkGz+fs/6/5X7PPyjEnHaVgz/8ajHaeggTkHqTNILvxe5gmYq5kXRu4pn3VwdBGGFG6Ab4/pwKhHwPrvTMwQ1f+6D5Qy4gaB3TfvTeVDl6ZohykYdBDV6P9bYqvNodogxWx/TmIREFQyORGdagkfmQlXPQDW1DK8/gFzfb+2fbZ1iIieKhKbbsyTSK5COKP1XPYB6JUMoxUgNqJP9mw1yj/fN8A5Cyenaec7WRa39lsuNwlM5bwNlW2eYksdXdupT9BWHU8GSQw0Pp4pRv31V6j2UBRkOETa6c/1NnnIhxADPwPG/o/5NOhPYjQ+QA3d55/pSEjzcmm1CxunqNfyG2ZHrlQg90ZFHuLGuktfMbvDA3QX/HbGcEj1BtauOqe7gv3Av32SRBUhQFl5NFpwTNQGI/NbRlag++6D1us1X2TPllpQw+DqAl3NsdLQKUF4dBGphA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(38100700002)(31696002)(86362001)(36756003)(53546011)(6512007)(6506007)(478600001)(8936002)(8676002)(2616005)(2906002)(186003)(31686004)(4326008)(6916009)(316002)(26005)(5660300002)(41300700001)(6486002)(66476007)(966005)(66556008)(66946007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVRTUFQrQlYwQ1h1YkU0SWtZWGVIaksxZ0RqblhRdzJPZ3FUNThzTDNaa1FV?=
 =?utf-8?B?S2tSNi9oV3k2cjJkTnZKT2ExWUFTajFRRCtFYzhBWlFTWlBzcEpTdU5kYnh5?=
 =?utf-8?B?b2lxTTAxTUc2M3Nkamh3TUMyUWRkSzdjYmtqOWY5UDVJSGs0U0JYajNKdWNP?=
 =?utf-8?B?QXJXYmZBQ01nYUUwUDg5Q3Q0aFVaZU9rYm9meWNRN0F0WHBDVWUydEQyWkda?=
 =?utf-8?B?WjRCUHF2bll1ZWpvRHVKOFBRRHhyQ2hIQ3kxdmZsa1pkQmdTbWd1Qnh1U1Zy?=
 =?utf-8?B?WW5aTEFyZ3pYZjNlNEdNM2lJeGROQzlZcVBrNTdFM0MxR3RLUmlIOHVIUnRu?=
 =?utf-8?B?aEN2SHdpYk56T0Z4dTVBVUxLdHRCWm1XTEg5ZHRWb0NUOXFxTE5LYk9UUkND?=
 =?utf-8?B?UW9pWWo0Y2dIajdzTUxqZGJhK1pPMlpIQVdkVDVWWkVUNXFZaVdPeVhld0V1?=
 =?utf-8?B?Mkp2VWIvUkEvYVpLbmxaV0NNRDJlWGhZNTZEQ0RBYUtDWU9pSDA1bk5yb01B?=
 =?utf-8?B?ellBV2c5T2pKQjBxa0hpUGlRcVk2RWh3QXExSDI3VDE1VWdXRGQ2YjNaUXE5?=
 =?utf-8?B?dVFEZU5TSm8rNlFyaGFEL2NwaVJtR3JteUF1b0hVRk8yVHl1QnpYcC9lR01V?=
 =?utf-8?B?YmlPWnZlRE9Hc2V4QjI0L0Q2VW5GUTNoc2c4VDF5anN2cFFhRkNWcE05dUJv?=
 =?utf-8?B?U0ZXbWwrOGp2RWpVZzJsTXFWM2kySmZYMlpoZklBSHgvbllvdUtPRjRTQUta?=
 =?utf-8?B?SjB1K1RrYWRyZWQxMDBFWVhIVXJ2aG5GbXIxNEZjblpmUEl6TUNOb3JWRFpi?=
 =?utf-8?B?Q0JSV05Qa0ZVbFlsSStVR3d2ck5tLy9CWkx2M0NtOVJSN1B1QVhVZ0pTWDVF?=
 =?utf-8?B?KzA1SFkxWlk4THAvRWpXMnhaS3JJOVVMYVVMcW5QSFhyakY4bnNEOXI4QU00?=
 =?utf-8?B?OTJJUXJ1SGw4Vzk1dWU3TWI2RjVNNVlZSGR0cVhwZUc1V1dtV2lSNUpyek5x?=
 =?utf-8?B?MWxYU0wzenFFNXdaYjJrNGtiR0NJS3hQd2xmRmFLcSthS3dXLzRZOVp5VDNU?=
 =?utf-8?B?K3pCd0FxNWlFMFZ6N3laWHdoNC9uMWVURlhmTm5GUkNIT0pRUEwxYWZOQUQ5?=
 =?utf-8?B?aXVTZXhCcGNXR0M2UTZyQXdad2tDU042S01NYmxMUHJXTElSd254NzQ4eUZw?=
 =?utf-8?B?ZEY5WTZWMmN1S2VMM0JFVzA4SnltelpDY2ExemdTNFZLUjVjWUt2Q0tRakJs?=
 =?utf-8?B?RnJTdkhPZjZ6cWcwZG5ua2tSZ3hWdENRV24weFJKcFYvS0NWNURaZGl0bU56?=
 =?utf-8?B?eTk1Y2xNcXFteGNqSUFNbWVwSVIzYUExWlRYY2F5bTNjYi93djVJbmNPaXJJ?=
 =?utf-8?B?NlBSdm1nVTI1NytFMml1NG9IQzViOHJvbEYwYzY0QlBQUkRpcGFpK3hCNVJV?=
 =?utf-8?B?Nlp3UWttVjdwOWZQcnEyTjBGRUxkdk9aVkVVM2tZTzhTN2txbDZCVkNiUjls?=
 =?utf-8?B?eUZNTm1jWUpudEJneHRSLzFSZ2VJaG90WXoraitDWUZEZDhnNnhnd1ZIWEpJ?=
 =?utf-8?B?WmppQ0NhYXdMbmJUVmhYOW5Wcm9zdTJSQUE2UVVRVWp5N1A5Rzg1YlVHSlZw?=
 =?utf-8?B?L0xZVURWU2NRZU8wTWFEMnlYQmtlMU9MallacjgxeUdSczJoNGYwamlHa3c2?=
 =?utf-8?B?aVBsUmllSjRuRnBJZkZLMzRybnNOcVZjdkxKWjc5UUo2UkZ4TnJIaWJsb0FK?=
 =?utf-8?B?NVFRdDliYlFKY1BXMDNGbnlBL2FHRHRaTm4xYjZmdFpHaVZKSTdjcnRKTVBj?=
 =?utf-8?B?OW9wdzdjVFFyNnFUSys2ZUtzNW9taWFMdEFHYmpQdGhHWnB4cWVOYWFIaURQ?=
 =?utf-8?B?TzZYZ0ltcjI0UjgxZnpBSWlTZmV3V2ZpSFVyeHRyb2hHcXJHcWxaeFlGUElp?=
 =?utf-8?B?bnJJUW9aa1hNZnpaTEhIenpYb3czOHZJbXVjeE5JUTB6Y3JjSmw5a2V2ZGJF?=
 =?utf-8?B?REt0QkVzeHc5ZTdJSlJCQXZNNDVHalBvRTlDNTJzbHRLQ1NiT1F2UlNlWHZP?=
 =?utf-8?B?WE0yWEExOUxZYytBTkZlc25PcVI2WkpCWUlSeHg1RU9yWVQ1SjBYVkxhckwx?=
 =?utf-8?Q?uKwo9HU+O/AGe+A0NQDnCyARM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ddad58-6c14-4e55-a537-08db5b5934fb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 06:44:50.4009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5erdTPedh9eILPUO37kId6vGEROML1JfivoOjPjYkgvT90/8y4wWXktmELqsFN+RTPfHu3pCvbtAVxMyXzo7WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9845

On 23.05.2023 00:20, Stefano Stabellini wrote:
> On Sat, 20 May 2023, Roger Pau Monné wrote:
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index ec2e978a4e6b..0ff8e940fa8d 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -289,6 +289,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>       */
>>      for_each_pdev ( pdev->domain, tmp )
>>      {
>> +        if ( !tmp->vpci )
>> +        {
>> +            printk(XENLOG_G_WARNING "%pp: not handled by vPCI for %pd\n",
>> +                   &tmp->sbdf, pdev->domain);
>> +            continue;
>> +        }
>> +
>>          if ( tmp == pdev )
>>          {
>>              /*
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index 652807a4a454..0baef3a8d3a1 100644
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -72,7 +72,12 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>      unsigned int i;
>>      int rc = 0;
>>  
>> -    if ( !has_vpci(pdev->domain) )
>> +    if ( !has_vpci(pdev->domain) ||
>> +         /*
>> +          * Ignore RO and hidden devices, those are in use by Xen and vPCI
>> +          * won't work on them.
>> +          */
>> +         pci_get_pdev(dom_xen, pdev->sbdf) )
>>          return 0;
>>  
>>      /* We should not get here twice for the same device. */
> 
> 
> Now this patch works! Thank you!! :-)
> 
> You can check the full logs here
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4329259080
> 
> Is the patch ready to be upstreamed aside from the commit message?

I don't think so. vPCI ought to work on "r/o" devices. Out of curiosity,
have you also tried my (hackish and hence RFC) patch [1]?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-08/msg01489.html

