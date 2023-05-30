Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8C7158F5
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540852.842912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uyf-0007MJ-EH; Tue, 30 May 2023 08:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540852.842912; Tue, 30 May 2023 08:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uyf-0007KZ-Ba; Tue, 30 May 2023 08:45:13 +0000
Received: by outflank-mailman (input) for mailman id 540852;
 Tue, 30 May 2023 08:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3uye-0007KT-3a
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:45:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4940fd9f-fec6-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:45:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7140.eurprd04.prod.outlook.com (2603:10a6:208:192::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 08:45:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 08:45:08 +0000
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
X-Inumbo-ID: 4940fd9f-fec6-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8zQ6/dI58QMuBvxhefJn5BHNsFI8ZnRKSJoARCIS99XfG9mivg9tPdpAvVfKFAzapf5WeihXbvGHRk6l8I/UmlMlt77vNW+MydAUHW4yk0fgPO2rO/gJCT/rayCeUGJwupJty2YY/RChEjUEa8KpJsCUKC/QNTRL+iQQZr4nVxf1auQr7TenZW4r9PvjJe1agwRZ3dvaNY8OwjffP+dFaO9iDSyzgoYb51RO1WQ3RbHRFKlY5iyXbcykDmRYX8BX/V42o3fCS87zHP5gwya9zMbhcCx5CEBoMJfpxSeP9WUTrQdcokwkdS3sLbEzzM5V+Le74UpJgelabmqE8mOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zu47yJ2xj9MjD0zlql6promCfCIozmdXgsSqEFHlAvE=;
 b=L0ihrSf1BzpJ0gcjmkQlbwbGoXF8+W1G80dJPW+4XhZJK01Knlec2xkQG9g2VubhR3K25WMEoTqTlTs4tK7ZbOfu2vf7FJ0SntcVJ23uZS7UWh14IUdXiECyOBdHmVX4YHea6UuAV1+clY8YQN/ltt6DHKxYehDYF3hHKPMaZSZrfW/3c3oK1use0lkmm0IAJtWCPBBnKjkJgmR4nGrjnA4bPhXrfqD/DVax9GgGTHquMDZ6u6i+9yDelegfpY8z5y1aIpYoeXKw1L4OToacdydJkfDurIHKQbY0AqSTysuuVJx4HrckAtXoWydvrCj/6GxaWXtEv1RB8aHSx9WdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zu47yJ2xj9MjD0zlql6promCfCIozmdXgsSqEFHlAvE=;
 b=LdkG6kFTyWnump+7FRP3QDiShFo3CaRwK9aWNiZkpGGraXgxkiG5sGDjtgxYqj/6cYq1hdz8zEdFBQ+ji6pVYKcFv6kzTwVTzNmr29azv43e1Hjq0RAgR+wy4Xv6I9Q12jdfquRJQDtbpSwWumRUylU6LHHR+pkBEg3QSTghKUndeEuaPdkJ1qneJv10RwC42rKq1+TBNqPQpLk44I1KnTGlhSb4pvYbUo04ipCvFTux28SF2KuhL8MLuoynOV75RSOcA/BbGP1SWUYx+lHb43wQ0q/0QVTZpfepzo9IHVs3+sNB0C1x+JRmRb0bK2PSuHhbNFhlnuTYQ9o8yYYgvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25663dac-6023-a9a7-a495-c995762191d8@suse.com>
Date: Tue, 30 May 2023 10:45:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4zx+TvUWTCEMh3@Air-de-Roger>
 <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
 <ZG94c9y4j4udFmsy@Air-de-Roger>
 <cedbc257-9ad9-56f1-5060-eaf173d45760@suse.com>
 <ZHRdjCKSVtWVkX96@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHRdjCKSVtWVkX96@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc2c8b1-c472-4668-095b-08db60ea2c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+xlgMfD+UCKKntAVIx3aY4qKeqB3BQmGPUihItzZJPJTQVhNcUfZSx+N3+naLphCXQ1331lqHmN57jPayuAt8xEke0sy78SDo1X3I/HKKk2RZhxMtKSsschb1awadZxtnP65yQOoaFTCmOXT/7SI3ycgQOH+E9c2ENS/9VT653YsGNFS5n8CCyWhcV8U/bxR+uFChkCFw6cZZc4XxKNUnrN1xptHCLzUC82U+Pasujv4dI53qT+5vLvZN59EqK9N6yI6kpiQkEThvjz5oEMeItGfZPSIREWq8qQrs0l/jx62phFFPIfVFCC+i162OnaNXmIL/IP46tdvfmkjH0gFC2/Dd6E0JtgjZrrK5xotRUHfNNG8y0ALILS43tUkNMsCjAa0YdpjNaorHdoTllJCOHdB5E45E9ccM1BiwaxhjHBeNZDblrTNfyk/8eUhamL1SkxKAIOioLoWppLk930xMjcToEagzXeOU5aNFccyZZZVw0kUSLWLuemKzwCfKmdtNwlj9vNqcp8vVuLAllBrpA5qq2XHFq1tciqC9qxjMwHKwAIQ6tehFsfdMsZHPgrJk6RgZiddNvzqDtrIu0xJZJx1MLKNXUq4T5FvCWf2jZmQ7c2LClU0s4tc5Ew3lgJRhdsOH9KuPUVcffF8FV9v5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199021)(38100700002)(31686004)(41300700001)(316002)(6512007)(31696002)(6916009)(4326008)(86362001)(6486002)(2906002)(8936002)(8676002)(15650500001)(2616005)(66946007)(66476007)(66556008)(53546011)(36756003)(54906003)(6506007)(26005)(83380400001)(478600001)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXA5b21lZm5US05YRFgwQmMxZWZYRFQ0TlA0a29DejViK2lML0VLd1hhUnpR?=
 =?utf-8?B?cFNnZC9pU1A4WEdpUHdkeEZSeDhoUm81WjdIMk11VTNwRWxYQ1BMTXhkZjlq?=
 =?utf-8?B?UDBNakFLTnR3Vnc2MUxGUkJiVUFnSUpUMVhsaGQrbEJRMVZVRFVIazJRU1Q0?=
 =?utf-8?B?c3lSOVQyb0hsKzNTdFE3b01jaTg1UEFiSUd5MDNvZDNTYlQ3K1hycXdJS2ds?=
 =?utf-8?B?Zi8wZks0Qm0zVUs2b2FoM0dhYXFpdkREQm5qRDIxYWdjb3lNSStmVml3VnV1?=
 =?utf-8?B?ODAyQlE5RDhaaHR4b1dMeCs5aVg3YjZYNllPRm10Tyt4cWZvZFllNkFRa010?=
 =?utf-8?B?cHk4ZzhhR3JRUkZKSExmd2YyUGE1ZGFZc2NUd296aUlJOEtXQUxUUEdGWDNE?=
 =?utf-8?B?TnV3aW1hMUJqU21tQkRKUnhjOEF0L0lpMWJkejY5ekNvSTNiMWZMNnFoVkZk?=
 =?utf-8?B?dDQzUmtrWTIvNXdJTzY3U3djeUlhdmk4RVJ5TlJzaDNVZEhFak9BWloySGQ4?=
 =?utf-8?B?T0pVVW5pZER5ZVl1dnp0Yi91dDExcTZkOEt6V205aFlESURDZEI4WHlBMDl5?=
 =?utf-8?B?Z2JjK1BrOUtibjY4dGorMWZkNzVlWXZ5bHB0cld2U3dod3ZkWU1MVHd6Rm1F?=
 =?utf-8?B?VTFDMzRSZWszaXdEU1BkYlBjN3FDRjZUbVNZVStZSGN6L0JoTFZqcUFzZzQr?=
 =?utf-8?B?Z3A2N0dWQTNwa2ZFbTl5c2ZZanZOZmpMTE9qRWZoVlZwaUltLzRTMlNibVMz?=
 =?utf-8?B?L1lmOGk2K2RXK3JNbGU0cE5ZQSs1NmVMNzhWbW80dTZDZGtGVW8wd0NrcHdG?=
 =?utf-8?B?aXp4Q3RZSlZIaHc4NEFscStvL3RWZ3Z6OU9zMmZ5Q1E4SVZqVndOMVRnVjJo?=
 =?utf-8?B?TDZKa2h3RWgzYUQrdmdLRVRnRFZGejd4ajNIeVlIV0dyanEvV3dMelZUc0tQ?=
 =?utf-8?B?M2VNRk9CVTl0OVZ5ZFJjNEUxY2JjdTYzeVBTZVdzUlJZTFl0c20zYjNRQ1Vo?=
 =?utf-8?B?Q2xpSWhVMjdmcWdJYUxZMlRjaEtYSHdod3NicWFqRWxhTWFtTzF5SGl1VWR0?=
 =?utf-8?B?L1VVTWVoNnRhRXprdFRpMGF4VEFxNmhETUZ4U2tYMSt1a1RoL3lxZ1pNMmNG?=
 =?utf-8?B?dlk5bnZGWUpLa05kNjhWVEM1Z1hDcnZRQm5aMENsZjM0c1poSFlscThVcExj?=
 =?utf-8?B?cERlejBLV3Iwb3RxMUNxREd1QXR1b01tc3QrVGxmM0ZTamg2NFZiTytCbHkr?=
 =?utf-8?B?RjhoL3VFNzhBb0F5Z1V1bEIvd3NSTXhUZGFqMmJ2b1gxTXRoeXRySTl5UUNv?=
 =?utf-8?B?NWNyWGVMUGhNS0poaXl6TlBrMEtuOHlsemQwWlpuOEdpMlBOL1lyR01GV3dq?=
 =?utf-8?B?UHZ1MEhTNHptekxLL3BacUtFMERmQzNveGpreFZtT3E4MTZudGw5ME5OUmRL?=
 =?utf-8?B?ekx2UENnQXdtSWZQQUdTVDQ1RVBMb3hIVTRXUW9GNXQ5dHhnanZnUlEvK3Ey?=
 =?utf-8?B?U0NsSnNCQy9DbVdYTHpUbDd1UC9TcW9IZEpXMFovcUhCNnZrSVlVRXlsMk4z?=
 =?utf-8?B?Q1ZHNXVHS3BZRG1CNnJWUDlWbi94Q05Ec250SURqMXdzalF1Ylc5b3RockxW?=
 =?utf-8?B?dndwdnFkVVpCTVgrSXFnOWpNRzRJQW9TWElRck15Ukd3djFOalh4enNneGYv?=
 =?utf-8?B?NVgxbGdrL0czR2lPUXE2SHV5WVp0anlKa0lJOWxDMStuclhwV2doV1ZoYlhX?=
 =?utf-8?B?NmMzLzZGYndhVDJuRXlNb3haWkVIQUpxVytTSXQ2U2x4S1phQnozOVBHRm4y?=
 =?utf-8?B?dzJESUlZYUFjbXRSRUJ0NUM0Tm5hQ0F6VTYvMWJRWkkwNVM1NDlEckpjbTY4?=
 =?utf-8?B?TFdwT3ppUlhvRlNRSERuUXdCVnhicUpVZWNOVEhqRXZ6ZFVYWmp1SkRRSTBG?=
 =?utf-8?B?Z0FkZ3BSbDlmNlcwTlVxUVE1MTRodXlMb1F1dVpsNWNTUlhhVlRsazgvbkxz?=
 =?utf-8?B?V2cxcVI4cU15cWVxUnJaUmpxbjNIanNQNVl6aXRtdEo5cXBCek10ZVB2ZWlF?=
 =?utf-8?B?Y2U1Q2d2K3BVVk1nYUpaTzFrSEZYaDdwamdNd3pnekZhcExlUEtTS3RCZ2hO?=
 =?utf-8?Q?l44IRTLFP8NiiOL4o8m2tVt/U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc2c8b1-c472-4668-095b-08db60ea2c6f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 08:45:08.8994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytAHlm03kXwHyuEbx43D/TlJoX6MA7UclLbYBcvBGfDlYnz6uB4O3Hgxw8FXZTRBUyio2Dew+xor8+5Wd7Tfmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7140

On 29.05.2023 10:08, Roger Pau Monné wrote:
> On Thu, May 25, 2023 at 05:30:54PM +0200, Jan Beulich wrote:
>> On 25.05.2023 17:02, Roger Pau Monné wrote:
>>> On Thu, May 25, 2023 at 04:39:51PM +0200, Jan Beulich wrote:
>>>> On 24.05.2023 17:56, Roger Pau Monné wrote:
>>>>> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>>>>>>      struct vpci_header *header = &pdev->vpci->header;
>>>>>>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>>>>>      struct pci_dev *tmp, *dev = NULL;
>>>>>> +    const struct domain *d;
>>>>>>      const struct vpci_msix *msix = pdev->vpci->msix;
>>>>>>      unsigned int i;
>>>>>>      int rc;
>>>>>> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
>>>>>>  
>>>>>>      /*
>>>>>>       * Check for overlaps with other BARs. Note that only BARs that are
>>>>>> -     * currently mapped (enabled) are checked for overlaps.
>>>>>> +     * currently mapped (enabled) are checked for overlaps. Note also that
>>>>>> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
>>>>>>       */
>>>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>>>
>>>>> Looking at this again, I think this is slightly more complex, as during
>>>>> runtime dom0 will get here with pdev->domain == hardware_domain OR
>>>>> dom_xen, and hence you also need to account that devices that have
>>>>> pdev->domain == dom_xen need to iterate over devices that belong to
>>>>> the hardware_domain, ie:
>>>>>
>>>>> for ( d = pdev->domain; ;
>>>>>       d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )
>>>>
>>>> Right, something along these lines. To keep loop continuation expression
>>>> and exit condition simple, I'll probably prefer
>>>>
>>>> for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
>>>>       ; d = dom_xen )
>>>
>>> LGTM.  I would add parentheses around the pdev->domain != dom_xen
>>> condition, but that's just my personal taste.
>>>
>>> We might want to add an
>>>
>>> ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_xen);
>>>
>>> here, just to remind that this chunk must be revisited when adding
>>> domU support (but you can also argue we haven't done this elsewhere),
>>> I just feel here it's not so obvious we don't want do to this for
>>> domUs.
>>
>> I could add such an assertion, if only ...
>>
>>>>> And we likely want to limit this to devices that belong to the
>>>>> hardware_domain or to dom_xen (in preparation for vPCI being used for
>>>>> domUs).
>>>>
>>>> I'm afraid I don't understand this remark, though.
>>>
>>> This was looking forward to domU support, so that you already cater
>>> for pdev->domain not being hardware_domain or dom_xen, but we might
>>> want to leave that for later, when domU support is actually
>>> introduced.
>>
>> ... I understood why this checking doesn't apply to DomU-s as well,
>> in your opinion.
> 
> It's my understanding that domUs can never get hidden or read-only
> devices assigned, and hence there no need to check for overlap with
> devices assigned to dom_xen, as those cannot have any BARs mapped in
> a domU physmap.
> 
> So for domUs the overlap check only needs to be performed against
> devices assigned to pdev->domain.

I fully agree, but the assertion you suggested doesn't express that. Or
maybe I'm misunderstanding what you did suggest, and there was an
implication of some further if() around it.

Jan

