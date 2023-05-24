Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0870F8FB
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539098.839638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pjU-0006A6-VX; Wed, 24 May 2023 14:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539098.839638; Wed, 24 May 2023 14:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pjU-00067c-Sp; Wed, 24 May 2023 14:44:56 +0000
Received: by outflank-mailman (input) for mailman id 539098;
 Wed, 24 May 2023 14:44:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1pjT-00067W-6g
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:44:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b5e05b9-fa41-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 16:44:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7731.eurprd04.prod.outlook.com (2603:10a6:20b:249::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 14:44:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 14:44:51 +0000
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
X-Inumbo-ID: 8b5e05b9-fa41-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKD/MBgDCo0iPURngbKZctXRxQ2EgCJ9L+WMEO+10E9h+Mg3E09kyASvs1SEf2koi13JK/rKElzFfZAscQpaRqnSMBx3nQM2pQjGOjuKoR39WRE3SQJLcQvD32zd/KnkNRjlGjRFDAIQgpr9VXsJntwJAY2aP8Ux0clf1cVzBfOg+DJJwiv4DHh+AmprfQ0+qNi40DraJIrCCqCB1t2NJWoCe4TyuZdnPWvUXhDyLnmy9ao8SZnAMidX+ABFxBguoFqq4LqZ3PacN3t3KFOQuAO2l9196ofH30yALigpwX/YTBo3fvFSOtVUebgqrGI018n5eV7WMOPHvJCDXoGJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcE4zPR0D4gZcd26hQ8qWH/3DDzjHPGYoR9nmzA4ibw=;
 b=dYJ2BsljE1fQeINF4Wnjq+dUTkjUG65v/y/VHE5NM7D/gkG9YTCynRHdfrduVlptDLxgaIta72KnV/VznMoxr8dcQFg9eAtaSkRH3cbOnimOvgRgu8oRr1GnRoBJXVlBzNBArV1XmTHgQxz9Wo6jKyxc5h7aDBFpTODE3M5OhU47xyZ+CEa31N7VsfglXR1XIj0qzoVOBMDkc0u2/Kian1u3cvoiLt6hdB4mz5vem6xllcc/rdZX266asq1cy/wfhijHNdM4QPhzxF8uj7XEd1IpUXC3hmWIaIUND5lo0dPHFZZToAyWnz5/qByVLmiFzGxuoEz3gQYK4bK0Dvw6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcE4zPR0D4gZcd26hQ8qWH/3DDzjHPGYoR9nmzA4ibw=;
 b=uGOChJXP+0Tz5F8DVoPvv3nN2TiMNL8VHIcDIAlbhJBy4emFJa8gVlZFpI9r1kPEJHEmyH55lA3b2t9AwvDWPy8huak/OW3fpFyC6MGMD63mK1DfS3UCZ6ghtZcpedvyWMrylC+Xjr9U36CUTV1qOuGoHPEVk23ZX2quZusE+yzfBTpTSW3hbnVJVXW0lN3YDMy+bif5HlRgyAxzbHeQrAXlYpAOCvU/27Z/VIV5axmlF7f3RYPioZs/Nmt8sMOd0v0LclIh0kZgvvwikoh4Dx2ZZexPIOtxxoF9N+uNeBLTvK3mDIM6kyJkC4P0nbcR3gGrUdy3nNSLqdryI1zgYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
Date: Wed, 24 May 2023 16:44:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4dmJuzNVUE5UIY@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZG4dmJuzNVUE5UIY@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2badaf-20cc-466d-e31c-08db5c656e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T6IdkuyOHOsw11Hq/PyIp6Tb7uYfNz6tKxTz2rLf2NFsdMy+lppxNf4sODYkAv6x4mgy6KeL1yti+tBOTszXS+cdvzdmT+zkBAWYWTnbB5EDmjDhuuCrdQJpH7VqYXWwrQI1lCu+6ZsnEGzVU9eScolDRlgKblQoWWlm0wxaiYA+HeN1s52hXdIbJF7eU4acUsp5ultZq9ksyfBBSkxVyedJYpNpzPlpMhkfv4QletmtLE/EcXTupJ9Wo7Rx6HlAsCmddENp7ey2Hb5KjbdmVMdt0SS3OEQOya0tIloMWzvMEAfc7+jFsPRLsclEYJdDLgwg4tXjAVRjOQsLL9ISQ8KFHF83ftBRj3epa/347SVCm18coLlUsPkwNC0mqurHyequrzq3UxuUghYtQDZDlIA8VM1AjSm+RnwGiy+1Ejs1URdgXzgEr7OXtg8r4AVvMMX9jV+THxKkK80YhGQTjNzz10NNfP/rQIY+8itpGOEE1URK1EnnMRKEzYQNeIuRhK5g0HB+pOYNzjYLv05t3Eensysn1rKp5jbfOKDPCwYArzYStw8+6i9uSrC290ZWpYMNJF4KVzjILcmLlUobMjghPpguRFaQqzLm6sh+WuECQTLabkAasq5HZLia0HvJFpsUjdc5gvE0uO2nS0U4kA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199021)(2616005)(26005)(186003)(6506007)(6512007)(38100700002)(31686004)(54906003)(478600001)(83380400001)(6486002)(53546011)(8676002)(8936002)(66899021)(4326008)(6916009)(316002)(66946007)(66556008)(66476007)(5660300002)(15650500001)(41300700001)(2906002)(86362001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGc1Zk8wZWI1WlRidWFyQlBNVkY0NnhYRTY2SzJxbU84aGxGZ3RONUQrSVVV?=
 =?utf-8?B?Nnh1dnBxYmF4QnZLd2xDd3o2WjJMN21MbUxOTU1uWUJ4dTJ3SEx2UzZ0QUdN?=
 =?utf-8?B?Z1VLcWwxSmlTSVEyMk02YnR2dUM2TDJNUXJaamhHYlY4dW91OUxBWGdXNjN2?=
 =?utf-8?B?ejNXV1ZQdmRBRHptK0NLY2VRRWplc0U3eEJ2MVJvdW5RSm9RaGcycU9CeEtN?=
 =?utf-8?B?N0J0Q0ZuUkZSVFZkcy9xRXdyTVluWExZQU5zUDEwOVFtSWxTL2twWUdFdFE2?=
 =?utf-8?B?VCt2ZCtPK2xua1UrVmZXNzJSUHFTQjhkYjk2czUzUVF6c3Jub09KcHJyUmVn?=
 =?utf-8?B?czdHV2kvVE9nY05PMGVpSkR0VkN5cERQQ1h2YlNwZk9GN21nTTIwL2tFbXVK?=
 =?utf-8?B?eWRhSDZZa1pVZnV3NlRnZy9kQzQ2Y3RxTGQ4OHRLSDhFeW9DSWs2RUZHTnFq?=
 =?utf-8?B?d2lQSnEwMTRDSHZIcWFZcHRUVmFKcjl2bUZnNVVKS0RWWUdnNUtxNjIzTW53?=
 =?utf-8?B?ZnpwM09XaGFHdnpxa0ZRQll6NFZBbFp2Y1lmdFQvOHVycGkrSzdpdEpjQ2J2?=
 =?utf-8?B?d250T002Sk9aNXpXQ0c5L3BjYnByemdkNHZMREsxcUR6S2htVkdtV2c2MTFN?=
 =?utf-8?B?RTVuWEJIS3A0UC83elhoT2IyNHVCWkFUR1R5N3NMV3VRWnlkalFUbGlSSDli?=
 =?utf-8?B?ckZmWUFoZ0VkVlFWS1JIU1VyRURSaXNuN0JBRUhKWE1rdm5pUk91T3RCUldQ?=
 =?utf-8?B?NHAvTFUwY3FjSlNEMVZML0MvRVZnMkRENUFKQjN0YTdSd0lzNkN0Wno1dXll?=
 =?utf-8?B?RVRIQVdOTURDeDRpV0RzLytmMlNIcE13czVxTmxQN3lHVG1rTVFwd1JRQ0Rn?=
 =?utf-8?B?UGRpenA0R1Q0Z3p0OEcwSkVRckZHdmsybXRCakhOQWhSQUJiWmxpcW5sRTI1?=
 =?utf-8?B?b3AzU01ndGswREpiUStSN09JWWordDl5Wnh2akJvTVZmN0YwSFdzNXBvYmZX?=
 =?utf-8?B?UkltNUx6bVUwdlJlcFljYWI1WWs1azhUTC93UUplVi9VS0toOUV3M2RycUJL?=
 =?utf-8?B?WEJ5aUJWc2NIa01tLzVpWUNNUEhKcGVqam9tRzRQOVd6OW9XRmtVemtPM09R?=
 =?utf-8?B?REFwMmJTQVd1N1dLY1ZSVnNtTHlxQTU3Vjc1MkJ0SXNCOFJZODh5MTUzbTBY?=
 =?utf-8?B?Vlp4anpUcWhWSDZDMXJKVUhmeDU3MEt1cE50U0RoSTIzNUIzQmcwOCtMKytT?=
 =?utf-8?B?MUZ1aU9ITEJkbUlCV2xKN0F0ZWZ6YzBpNXBhN0kwTytrZVpNUWpqN0I4ZlN2?=
 =?utf-8?B?c3B0QkhpbDFJSXMrUFpqdlRSSUs3YlkycHl0UXdSZkZyZlFOd0k3ZkpGWWpZ?=
 =?utf-8?B?TkQyMHJuZTNEYmU5SWl0S1R4Yk92SFVPWWpxWDZnelN6eTJYVEU1WDhXai9C?=
 =?utf-8?B?WFRyKytFalRhWEFFajJxK25oaDFieFh2N3ZDODdHang3WFVwYUhLTjlJeC9x?=
 =?utf-8?B?dFlJTVNrbksrV09iOGVvL1hwR3kwSmR4SGhzaVFVTm8xaC8ybU4rSjgzOWxI?=
 =?utf-8?B?eVNBblp3TmtMeWpuWDN3MEVkb0JUc3dpdnBLVDZQeHBwSHZVbUxMLzJ5cEcw?=
 =?utf-8?B?RHhmTFNhZzM1ZXZPa3I2R1RwR0NYZWs4S1JMcWEvRmEzMWlITzg3eWJFNEVP?=
 =?utf-8?B?Z3E0aVlDdXhsK0NCdVJWZERyTFpzV0tSTDZHelcrdmNsTXlCaFBaY3hON3hz?=
 =?utf-8?B?dlBWTFRCSEttcVU3MS9xWUxma3E3N2R5STFCTHBuZ1dRejNlRVhBZWYyWmpa?=
 =?utf-8?B?cUppVkdHcjEydHRTWTJSYWJ6SkEvR3RqZnhqV3pqNXFLem5Sd2tiUHZkQmxM?=
 =?utf-8?B?dnMwV1RkVUZXVXgreU4wWDMvZ2JzYlgrdEErRzJQcS92WS8vcVpVWmxNSG5P?=
 =?utf-8?B?ZVhZbkpWUXVoSHJDNXptanJJckI4K055RUJQR1NNWXYzV3FiWStySmdFNTds?=
 =?utf-8?B?STZaeDJvbTh2cmY2SVBWbVM2QVE0SW1PcXc0SXdEUjlEeWRVKzFGMkRBZllP?=
 =?utf-8?B?T3kzbDVGakR6ZmJqOVBlV3ZRNEJjUk9hbzZnRERrK2k2bUZpcm1kVjY0NmRL?=
 =?utf-8?Q?y5QlHSIlmndeQu+dbhHj4kFXs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2badaf-20cc-466d-e31c-08db5c656e01
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:44:51.1709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+fQoJYK4k1n+j6s9C4xeGod2e6Gp4d6aMvxWkCXTLMBL27ciosVBKm84THG6w9b0ifGwoIYZToGkLv4XU/lCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7731

On 24.05.2023 16:22, Roger Pau Monné wrote:
> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>> console) are associated with DomXEN, not Dom0. This means that while
>> looking for overlapping BARs such devices cannot be found on Dom0's list
>> of devices; DomXEN's list also needs to be scanned.
>>
>> Suppress vPCI init altogether for r/o devices (which constitute a subset
>> of hidden ones).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: The modify_bars() change is intentionally mis-formatted, as the
>>      necessary re-indentation would make the diff difficult to read. At
>>      this point I'd merely like to gather input towards possible better
>>      approaches to solve the issue (not the least because quite possibly
>>      there are further places needing changing).
> 
> I think we should also handle the case of !pdev->vpci for the hardware
> doamin, as it's allowed for the vpci_add_handlers() call in
> setup_one_hwdom_device() to fail and the device wold still be assigned
> to the hardware domain.
> 
> I can submit that as a separate bugfix, as it's already an issue
> without taking r/o or hidden devices into account.

Yeah, I think that wants dealing with separately. I'm not actually sure
though that "is allowed to fail" is proper behavior ...

But anyway - I take this as you agreeing to go that route, which is the
prereq for me to actually make a well-formed patch. Please shout soon
if that's a misunderstanding of mine.

>> RFC: Whether to actually suppress vPCI init is up for debate; adding the
>>      extra logic is following Roger's suggestion (I'm not convinced it is
>>      useful to have). If we want to keep that, a 2nd question would be
>>      whether to keep it in vpci_add_handlers(): Both of its callers (can)
>>      have a struct pci_seg readily available, so checking ->ro_map at the
>>      call sites would be easier.
> 
> But that would duplicate the logic into the callers, which doesn't
> seem very nice to me, and makes it easier to make mistakes if further
> callers are added and r/o is not checked there.

Right, hence why I didn't do it the alternative way from the beginning.
Both approaches have a pro and a con.

But prior to answering the 2nd question, what about the 1st one? Is it
really worth to have the extra logic?

>> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
>>      modify_bars() to consistently respect BARs of hidden devices while
>>      setting up "normal" ones (i.e. to avoid as much as possible the
>>      "continue" path introduced here), setting up of the former may want
>>      doing first.
> 
> But BARs of hidden devices should be mapped into dom0 physmap?

Yes.

>  And
> hence doing those before or after normal devices will lead to the same
> result.  The loop in modify_bars() is there to avoid attempting to map
> the same range twice, or to unmap a range while there are devices
> still using it, but the unmap is never done during initial device
> setup.

Okay, so maybe indeed there's no effect on the final result. Yet still
the anomaly bothered me when seeing it in the logs (it actually mislead
me initially in my conclusions as to what was actually going on), when
I added a printk() to that new "continue" path. We would skip hidden
devices up until them getting initialized themselves. There would be
less skipping if all (there aren't going to be many) DomXEN devices
were initialized first.

>> RFC: vpci_write()'s check of the r/o map may want moving out of mainline
>>      code, into the case dealing with !pdev->vpci.
> 
> Indeed.

Will extend the patch accordingly then

>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>>      struct vpci_header *header = &pdev->vpci->header;
>>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>      struct pci_dev *tmp, *dev = NULL;
>> +    const struct domain *d;
>>      const struct vpci_msix *msix = pdev->vpci->msix;
>>      unsigned int i;
>>      int rc;
>> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
>>  
>>      /*
>>       * Check for overlaps with other BARs. Note that only BARs that are
>> -     * currently mapped (enabled) are checked for overlaps.
>> +     * currently mapped (enabled) are checked for overlaps. Note also that
>> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
>>       */
>> -    for_each_pdev ( pdev->domain, tmp )
>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>> +    for_each_pdev ( d, tmp )
>>      {
>>          if ( tmp == pdev )
>>          {
>> @@ -304,6 +307,7 @@ static int modify_bars(const struct pci_
>>                   */
>>                  continue;
>>          }
>> +if ( !tmp->vpci ) { ASSERT(d == dom_xen); continue; }//todo
>>  
>>          for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>>          {
>> @@ -330,6 +334,7 @@ static int modify_bars(const struct pci_
>>              }
>>          }
>>      }
>> +if ( !is_hardware_domain(d) ) break; }//todo
> 
> AFAICT in order to support hidden devices there's one bit missing in
> vpci_{write,read}(): the call to pci_get_pdev() should be also done
> against dom_xen when handling accesses originated from the hardware
> domain.

Hmm, right. Without that we'd always take the vpci_{read,write}_hw()
path.

> One further question is whether we want to map BARs of r/o devices
> into the hardware domain physmap.  Not sure that's very helpful, as
> dom0 won't be allowed to modify any of the config space bits of those
> devices, so even attempts to size the BARs will fail.  I wonder what
> kind of issues this can cause to dom0 OSes.

This is what Linux (6.3) says:

pci 0000:02:00.1: [Firmware Bug]: reg 0x10: invalid BAR (can't size)
pci 0000:02:00.1: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
pci 0000:02:00.1: [Firmware Bug]: reg 0x24: invalid BAR (can't size)

Jan

