Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E03545D871
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 11:52:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230860.399088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCLx-0007f8-P5; Thu, 25 Nov 2021 10:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230860.399088; Thu, 25 Nov 2021 10:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCLx-0007cc-LK; Thu, 25 Nov 2021 10:51:45 +0000
Received: by outflank-mailman (input) for mailman id 230860;
 Thu, 25 Nov 2021 10:51:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqCLv-0007cU-FM
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 10:51:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac43ebbc-4ddd-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 11:51:41 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-4Ym-RGmqMSaurZgYrKI-Sw-1; Thu, 25 Nov 2021 11:51:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 10:51:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 10:51:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 10:51:33 +0000
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
X-Inumbo-ID: ac43ebbc-4ddd-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637837501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zQMTHZ0xf21aSUN/Bzaq5BvcL+OzDY4jFixdwGrXdc=;
	b=Xwu4rVMV1JllN79hscf3nppAVW+B+ZILm/5PYo/afDxtDzbZKbIidRCRQyZhUJsk9C3yau
	9C531wErNz9EVhKvNqx1qIfbBD6cLdq5jF0pU1KGah4vMDEda5H6fykZwLJDm86riBwN5V
	gcvPi2WsOHLdiuxKc7MHItfBFX1X6Lk=
X-MC-Unique: 4Ym-RGmqMSaurZgYrKI-Sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcJZ+Y04HkZHLoNcpuXk1ICpq6LpjvZWtEarDyLR/PETC70K5NMqQ8qWJcSI4724MWI3WfVW3QESpLS/5uXxuHmMizoveLBV+K3CRnLtSF6Wo5X45+F1u74QGfghGULUNb94pOTODWvPW0uBvWSvkSsgxiGCTq8mBigB6qjpOlXhdAVDHZHQHGB3YCqaPOoB9BX/AQbUwbug7xQ31/v4SwuQWH+bFWJaxs0VVe/RKL6A/pdO+kySiTzrrXlaXVJjg/ohihlV15aeYUqaRAmNcHNqYaS4xQ9P10ZjjZ2pXFDOg/Usfp6Ftz52a2cUON+Fiuylm6hikIB7QhNJ39or7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zQMTHZ0xf21aSUN/Bzaq5BvcL+OzDY4jFixdwGrXdc=;
 b=djIBH71hl6LRRwuTlwwWSa7ghiERDl9MfXukUsnnsfP2X0MGEdjxyl5CWjLEDQ+y+tfvSiwyLkHzlnmcDXBjPXZOG/sRF2qBdQ/9IUsEEDzVSFEw5/PMOcrQMINJ7HEaSqOeA+n3aZMNY3p5fqBjVrzNc49n1Iqfzb7LExxPTPgUuxzJhn9XgTdl0s3WwWSfQxKogXEGgDTG4pEK85yNyr2h+0869Dsh9WISp6tmz/A38EHqx3ZYM17iEewQJSLJl7s9xIcfcGqYW6MoNxfQheOkn9hoHu+eTEuJqUzXBpYeTX8UlVe+tc8wBX43JKAlELG71CzXjIWw5FDRHrp5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <587fd950-ffdc-1888-5f97-2ea142069f57@suse.com>
Date: Thu, 25 Nov 2021 11:51:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
 <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
 <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
 <e64c22c7-992b-9fdf-a276-263e9173a313@suse.com>
 <fffb492e-f570-069b-7355-c00f48215dad@suse.com>
 <8512f6a7-0b79-8fff-49fb-80c3d8a7a436@suse.com>
 <db2a0bc9-386e-3198-f8f8-95121571abdc@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <db2a0bc9-386e-3198-f8f8-95121571abdc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0032.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 951756cf-8b65-4a2f-973c-08d9b0018c21
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532779299DA05E3C242EFCCBB3629@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TUfXEeldp1vzjtPkkyzcBE5k/4EyKGAlLI+m0xcNkTnP/ucxlGcVPiiXcL4KC782GjO9EkDOaxPY3B6rbVMCa0OpWYaK7Hkjj721jP2Cq4Sg2ZM/90yJBhmSYUOxLJC6mDOXtVr0MYdsVmDY/7eeYyN/BiIKGLRzH6WNozyYnPLcBAiJv4ebm5yG/PFcCVzkDD1Uj6+sKxTSHdmHnctwurCAp1osZKYPvSvcIaubKlcCmu4/22BRcqzoB0pMUM33jr2f3+vJkE6ftAcNA6nccNOA2YQe11vF3qhXw1574HyiTpo8SAA6XkYioDVPzxXtMxHL09n5soZCX3GEWhR4bkY3lo7iZoVAegAfSGqNKPh+svH92pRkQHgvSg5FDrsS9PKbrXrcAgKQHgJ2EQHSWzI/fqLeYHMzXo/ouV890fcgEHIsb009GZZtgdTE5L7pNkLGUf+RaqWOG5BdQWCfGsicu3x2hVYW2UIf/z4UpyvRmxNoznarnk2c3f6tYauc2cX+5AjaWjYzwFdl4JCVgEOEWpDcXs4+3kVkX90wwMO2s/3LdH9D6lJetKqBG0noO/zkESKpVdc9FlpcEAiBGYUdfZKHU0G9pX+haWnmVcER6eOtGM0DmmFWoVH3J9WEBfmZnJEyR+j6K2rvGwJ+BW6FYAuCgCHuRcUTpWsmKXwpyuQiUe5MxiOBX5W1XzAlt7tK5YctjVAp36IMqAMLKzAv7V9OspKDZXStK42asCgvYzOAOkLSM/JNE7itaTPJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(2616005)(8936002)(956004)(5660300002)(6862004)(83380400001)(31686004)(4326008)(38100700002)(8676002)(16576012)(6636002)(26005)(186003)(37006003)(86362001)(508600001)(36756003)(66476007)(66556008)(53546011)(2906002)(316002)(31696002)(66946007)(6486002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1hLUDlJcExzVlp4S0crdlg4aWNzNVRHeTdXNjQ3Z3c5NDM1bDl2eE5rTHhu?=
 =?utf-8?B?UUx0YVUwM1RwdkVGZWZZQVpYZWVFS1E2bWF4dm9iMjcrTzNDdzUwSXkrTWNO?=
 =?utf-8?B?RlVPWm9YVGJBZFlhVGx2NjFkVnNreHRRMXExekdBb3R1ckRodkxGZ0xxR0dJ?=
 =?utf-8?B?dTVKL2tQSXRCOXRKWkh6bnRtVWJkM0RUdnd5Vk5uRTREZGtzNFU4dlQxT3Fx?=
 =?utf-8?B?R2hmL1dTeGp1VVhWUElNVnpralNBQnRBMkxsWDg5S3JpRGxRYjRjZHEyM3Jz?=
 =?utf-8?B?TCtNTE41Mkd5YVVsWDc4eWhrdjFRVzdiYlRxWlN0Uklvd0hKc1RZR0lhRGRZ?=
 =?utf-8?B?UkgxVjl4WjMvUnpMTlJ2YlptMlVvUVRqNjc5UE1WT3dwODZDVE5aaTB2VU02?=
 =?utf-8?B?eDlEcTF1K2E0UURiRU5QdVZFbzA5NzlPeWNOK0w2TE0rS1BOb1NmajlMRWVQ?=
 =?utf-8?B?OHNIU2tMZFE0UDN1QnMzYStoY2pheThyMld0SHd0TCs4UHN0VG9yTmxPeVFN?=
 =?utf-8?B?ODZuVU9HT0FrdDRSaG5HTjF4NDkyeW0ya1RPNkRzVjg2V2dkZGk0WXByQlp3?=
 =?utf-8?B?eU53dngvTXYzQ3l6VDg2Vk5HQkltaHFvdHU2K3NJUzJNUVQ2LzZld2dPSWUz?=
 =?utf-8?B?Ylo2cEpkZTVzb3h4dHhxYW9OUUNLZ0t5blJTZDd0eG9VSng4OEJGVUg3NC9v?=
 =?utf-8?B?UCtTZEM1V3dzZ2o4OG80Nmd5akQ4cEYycVlUMjNwTEt0MnFMcDZGT0NnZzBY?=
 =?utf-8?B?dlZLcWFEZzFhZTlGV2Z3T3hnZjJnaUhxNjlqd3U4cTJrcmZ1T25GUTZuSzhO?=
 =?utf-8?B?VFdPVlFubmtPNU15dW5vN1NITkVxenVZOVRWVmxkaUpHdXhkeG1JU0dzd3Ev?=
 =?utf-8?B?OHdxVUJKMmZYZ3h5M0IwUWxHdXptd2swdGVTM2NkK241T01rUXhzK2piamEv?=
 =?utf-8?B?WUNoaUhkeTEzd0RSZmlaNjBlenVMN05Ka0hzSlVxRGtVYjkzeFFjamQ0OVVY?=
 =?utf-8?B?Z0xQd3RMZGlmR1pkTVg0UDdVd0ZiVHNic1RRM0o4Y2NRM3BDeE9ROVFLSGxt?=
 =?utf-8?B?N1lmTDVNVjY0S29jc1RQUXJVcG1uKzA3MjJTUjl4bHp1TnE2UExXMlVMY3d4?=
 =?utf-8?B?VGRuSllzWFUvK0VvL0VkSWRLQU12VnIvdFJnallqWDZYenlmTDlwZVpGTWdy?=
 =?utf-8?B?bzJVL2RtVVFRYVZHNkd2TFpVQUxtUTVLTGFWTFVaZ2lIT256cUlzQ3dsUDdZ?=
 =?utf-8?B?SW1uMEUrcFE1UVNoejFhMUdyVXFtSEVQdDZkZ1Y1ZEJHVUg3amxmQW1ScXJh?=
 =?utf-8?B?b1g5N2NSclpSTWhDSSt5UTN6eWs3Q21PcEVEdzFYaENsenJOMDZySGJRbTkr?=
 =?utf-8?B?Y3pteHB5d0xMZEc3c2VJRU9pTm1lSXJyd1I3WEF0cENPT1J2VG9VSW1NVmJz?=
 =?utf-8?B?MnRWaDkyclBQdGFaWDg2cDlqbG9UNmtqTFVDRTgzMjN4WTVVU1F2bW84Q0p5?=
 =?utf-8?B?bTNsOXdrSTZUY2FsbXYwbXZuWEd6bDZaeWhoN3E2b0NKWHROMFF5NmUxU1cr?=
 =?utf-8?B?S2dQWFRDcHhCVjhiV3BHaytpeDJmUjhoSzBYNHJhRWZsTVVLUS94WENCSkFz?=
 =?utf-8?B?NXZjN2NmK1c1WWFIM0dGcC9KdjhlTTRTOW95YkcwUkFvYXBSNUxOYTZPMHYy?=
 =?utf-8?B?TG5wbzFPRWtJQWEyWGNiWTJQTjdsWVhuSjRwbFJzb2VEV0o0cW9BZlBIV2M4?=
 =?utf-8?B?SWFnajV5Qjl3SHhKSGNUdHlQK1dYN0lnNmlWbk9FZ2J1YnZTNUF0TUZvb1Jy?=
 =?utf-8?B?dEdBdTZWQlNScjhpeS9za09IWVNOV3g1UUhMbzVYN0xoMzY5eGc3dEoxMi9Z?=
 =?utf-8?B?NWZqNE1zUENmVHJ1K0dUczJpNEZsRzZpbG90YS8rOTI0eDU3S0tMZGk4MUFI?=
 =?utf-8?B?TkxjUzR2eVNSTzNmYUZyeE83TlgyN0NwQW9UUzduRTBENHk1bGU4OU81Y1Zz?=
 =?utf-8?B?TStxMmNMYVgxMjRtVFlLTGNiNTVkcU9GNDFOMGliRGNCa3lFZTl4U1AyRUxh?=
 =?utf-8?B?UTZEWktBaHNyZHhhbnpva0kyYzNVd0c5QTVZRERza1lkVWpRV2Zoc1Vsbyta?=
 =?utf-8?B?K3ZGN2Rka2lFcDhIek1leXhPSFVTWTdoL2ZubDFGdXZKZjlEZVRhdVQ3UUxP?=
 =?utf-8?Q?/+c8KXiiInU/1dgymUB9HQA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951756cf-8b65-4a2f-973c-08d9b0018c21
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 10:51:34.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxG472fxopYBsAA+WedzqAZmpEwysDxfLD/8Sre+3IT5iSR1qvSoU0eGcyXKNvM5z/dyoHjTVSpoB4luPOYC2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

On 25.11.2021 11:33, Juergen Gross wrote:
> On 25.11.21 11:19, Jan Beulich wrote:
>> On 25.11.2021 11:12, Juergen Gross wrote:
>>> On 25.11.21 10:38, Jan Beulich wrote:
>>>> On 25.11.2021 07:55, Juergen Gross wrote:
>>>>> On 22.11.21 16:39, Jan Beulich wrote:
>>>>>> On 14.09.2021 14:35, Juergen Gross wrote:
>>>>>>> @@ -103,6 +104,43 @@ void domain_reset_states(void)
>>>>>>>         rcu_read_unlock(&domlist_read_lock);
>>>>>>>     }
>>>>>>>     
>>>>>>> +int domain_get_dom_state_changed(struct xen_control_changed_domain *info)
>>>>>>> +{
>>>>>>> +    unsigned int dom;
>>>>>>> +    struct domain *d;
>>>>>>> +
>>>>>>> +    while ( (dom = find_first_bit(dom_state_changed, DOMID_MASK + 1)) <
>>>>>>> +            DOMID_FIRST_RESERVED )
>>>>>>
>>>>>> As per my comment on the earlier patch - the use of DOMID_MASK + 1 vs
>>>>>> is quite puzzling here.
>>>>>
>>>>> Okay, will change that.
>>>>>
>>>>>>
>>>>>>> +    {
>>>>>>> +        d = rcu_lock_domain_by_id(dom);
>>>>>>> +
>>>>>>> +        if ( test_and_clear_bit(dom, dom_state_changed) )
>>>>>>> +        {
>>>>>>> +            info->domid = dom;
>>>>>>> +            if ( d )
>>>>>>> +            {
>>>>>>> +                info->state = XEN_CONTROL_CHANGEDDOM_STATE_EXIST;
>>>>>>> +                if ( d->is_shut_down )
>>>>>>> +                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN;
>>>>>>> +                if ( d->is_dying == DOMDYING_dead )
>>>>>>> +                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_DYING;
>>>>>>> +                info->unique_id = d->unique_id;
>>>>>>> +
>>>>>>> +                rcu_unlock_domain(d);
>>>>>>> +            }
>>>>>>> +
>>>>>>> +            return 0;
>>>>>>
>>>>>> With rapid creation of short lived domains, will the caller ever get to
>>>>>> see information on higher numbered domains (if, say, it gets "suitably"
>>>>>> preempted within its own environment)? IOW shouldn't there be a way for
>>>>>> the caller to specify a domid to start from?
>>>>>
>>>>> I'd rather have a local variable for the last reported domid and start
>>>>> from that.
>>>>
>>>> Well, it probably doesn't matter much to have yet one more aspect making
>>>> this a single-consumer-only interface.
>>>
>>> For making it an interface consumable by multiple users you'd need to
>>> have a per-consumer data set, which would include the bitmap of changed
>>> domains and could include the domid last tested.
>>>
>>> As one consumer is Xenstore, and Xenstore can run either in a dedicated
>>> domain or in dom0, I believe a multiple user capable interface would
>>> even need to support multiple users in the same domain, which would be
>>> even more complicated. So I continue to be rather hesitant to add this
>>> additional complexity with only some vague idea of "might come handy in
>>> the future".
>>>
>>>>
>>>>>>> +/*
>>>>>>> + * XEN_CONTROL_OP_get_state_changed_domain
>>>>>>> + *
>>>>>>> + * Get information about a domain having changed state and reset the state
>>>>>>> + * change indicator for that domain. This function is usable only by a domain
>>>>>>> + * having registered the VIRQ_DOM_EXC event (normally Xenstore).
>>>>>>> + *
>>>>>>> + * arg: XEN_GUEST_HANDLE(struct xen_control_changed_domain)
>>>>>>> + *
>>>>>>> + * Possible return values:
>>>>>>> + * 0: success
>>>>>>> + * <0 : negative Xen errno value
>>>>>>> + */
>>>>>>> +#define XEN_CONTROL_OP_get_state_changed_domain     1
>>>>>>> +struct xen_control_changed_domain {
>>>>>>> +    domid_t domid;
>>>>>>> +    uint16_t state;
>>>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_EXIST     0x0001  /* Domain is existing. */
>>>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
>>>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_DYING     0x0004  /* Domain dying. */
>>>>>>> +    uint32_t pad1;           /* Returned as 0. */
>>>>>>> +    uint64_t unique_id;      /* Unique domain identifier. */
>>>>>>> +    uint64_t pad2[6];        /* Returned as 0. */
>>>>>>
>>>>>> I think the padding fields have to be zero on input, not just on return.
>>>>>
>>>>> I don't see why this would be needed, as this structure is only ever
>>>>> copied to the caller, so "on input" just doesn't apply here.
>>>>>
>>>>>> Unless you mean to mandate them to be OUT only now and forever. I also
>>>>>
>>>>> The whole struct is OUT only.
>>>>
>>>> Right now, yes. I wouldn't exclude "pad1" to become a flags field,
>>>> controlling some future behavioral aspect of the operation.
>>>
>>> Right now I don't see the need for that, see my reasoning above.
>>
>> If your reference is to the single consumer aspect, then I don't see
>> why that would matter here. Future xenstore may want/need to make
>> use of such a future flag, yet older xenstore still wouldn't know
>> about it.
> 
> I'm not sure it is a good idea to mix IN and OUT fields in such a struct
> which is meant to return information only.
> 
> I'd rather add a new sub-op in this case taking another parameter for
> specifying additional options or a struct prepending the needed IN
> fields to above struct.

Well, okay. May ask for a /* OUT */ comment then ahead of the first of
the struct fields?

>>>>>> wonder how the trailing padding plays up with the version sub-op: Do we
>>>>>> really need such double precaution?
>>>>>
>>>>> I can remove it.
>>>>>
>>>>>> Also - should we use uint64_aligned_t here?
>>>>>
>>>>> Yes.
>>>>
>>>> But you realize this isn't straightforward, for the type not being
>>>> available in plain C89 (nor C99)? That's why it's presently used in
>>>> tools-only interfaces only, and the respective header are excluded
>>>> from the "is ANSI compatible" checking (memory.h and hvm/dm_op.h
>>>> have special but imo crude "precautions").
>>>
>>> No, I didn't realize that. I just looked how it is used today and
>>> agreed I should follow current usage.
>>>
>>> But even with using a stable interface I'm not sure we need to make it
>>> strictly ANSI compatible, as usage of this interface will still be
>>> restricted to tools.
>>
>> True. Problem is that our present __XEN_TOOLS__ guards have effectively
>> dual meaning - "tools only" and "unstable". We merely need to be sure
>> everyone understands that this is changing. Perhaps when you add such a
>> guard here, it may want accompanying by a respective comment.
> 
> I'd be fine with that.
> 
> Maybe we want a new guard "__XEN_INTERNAL__" for that (new) purpose?

Not sure - this may result in undesirable code churn elsewhere.

Jan


