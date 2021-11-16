Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F94536FC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 17:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226420.391303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn11n-0007mm-QG; Tue, 16 Nov 2021 16:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226420.391303; Tue, 16 Nov 2021 16:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn11n-0007jt-My; Tue, 16 Nov 2021 16:09:47 +0000
Received: by outflank-mailman (input) for mailman id 226420;
 Tue, 16 Nov 2021 16:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mn11m-0007jn-3s
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 16:09:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cc1bf93-46f7-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 17:09:44 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-5yoe6qwlP8SQ5YZswv-vnQ-1; Tue, 16 Nov 2021 17:09:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 16:09:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 16:09:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0048.eurprd07.prod.outlook.com (2603:10a6:20b:459::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.15 via Frontend
 Transport; Tue, 16 Nov 2021 16:09:39 +0000
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
X-Inumbo-ID: 9cc1bf93-46f7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637078984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iYm0VtEp7kV2wnizbYcIm3VxzzYeWnY1FeNOdHKy8nU=;
	b=Ds8VEZ59ujPhInkErOsLznaB8SD9jmKZowBaArr7dw4MoSJgknsFsISF+5LDs3YifJlI/w
	yzQBaeU5sZOWOyKNPZXD0bjX8bpFJ5dO+EhYy9QCB83bYsrffPtwDaaQCrjE26axwjciwB
	ctV/e34Q6Kf8dYYPb6d9F7CAYYMA+rw=
X-MC-Unique: 5yoe6qwlP8SQ5YZswv-vnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9HrRKRk3VLAkt//9jb5ZhgevwK3e+qi/24GsVZU/scXY/rkeRiIaFSgdZMKQ/EHLGb97E8dKXqrMFI2TK03zvo95hTjOH8n4SN9MsHouDtSQtIqZ/u6YMp5x6LyUBTXdFSsWw8SsaNYj8nkw+2dSQs4fwVjYZypOJMwJ7zuwUO9Dl28QasLD1xPowmAh0J+GxVaGwu4GZokazc5dJwlG946C5mcJamxcQE505Jr/HNQ1N/64odPiTdXxq2V3S6lxcP3lQgVl1JsuAC4imW7paHra7rR1FulkFpTRITU1eRf2uO1o2VyHh3+2XbkVztMlnVLRjVyP9fGmLbQ1xMXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYm0VtEp7kV2wnizbYcIm3VxzzYeWnY1FeNOdHKy8nU=;
 b=Kv5YcNhEfGIkhvQd3xXQxBcQ7lXZDGf8Ze4f4EPp78yoLVd5e5+jBe6CKhWWgC1OLO7QZahu51dHUeX5DVWX4MCsjY8+vaoJhvDdAWEg9jKddgJAB1HIDZBofpWuuZkwggLIgDnRHaSmKa3N+2pWqcOEm+RloFD6pjwgLTBKXPDFZMBX4GYWm3CXfFCJ2t7DfQ61MEycT+FeMqJ+S9FEWK3P6ywEWCLVTrSl0a20Dk07Uv6QMytGkW/qsnZKSV1L9xTL1kbwZvVrgmk23XLF9NZinTDHhwUX3y84zDVG93Pb+ToiZ6vBp9R5iHOYAz9qVLRaaC9+V2pY69aOYPIHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7fc8313a-0806-ee8d-d752-a2a8c4193bcd@suse.com>
Date: Tue, 16 Nov 2021 17:09:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
 <ad01ebdc-7fb8-3c76-d953-08b73b4b0c25@epam.com>
 <fc1fdee4-e567-038f-a90b-127548a8da02@suse.com>
 <55a95ff3-6717-780b-25f9-c43728b6270b@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <55a95ff3-6717-780b-25f9-c43728b6270b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0048.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8004a1d8-2288-42a0-99d9-08d9a91b7ec8
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2958DBBB198CEA4DEBD42A8EB3999@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	biqoN3/6mhHUPAXJa2jL2QaujXKKM9ZZiIOUPX8wGRY/UsS+x07UcWEvYzf6B8fLAvyqGdEtfjO0kV8RHu628o8Ju3pZ65Afbfd26jkq95Gkm5od3YA33lBerehOWhcCNQ3Hno6NKXsdBu1nPVTT2cH4FpXXM2ND7jYfArvx7G3TDx23AxKmnFkw+2xZPtYQE01DizoiM6hn7ipJY4ocpBIX1XUDYsoNQy2V96x4gJqtbX4xTBO7f2KUOVsSJ6//DIYj8Z/JtiGkEubi985CRzUCsYhVuqrVOkKtw1fzcpVka6BoLhicPxVBzAcAyDXfy04Cy9DJl4hB6A3K6PdEGqiJ3Bdg1OGlqW49Phu5CtlgXmt7ngDv6gQAfhUiMnRP1B9SVkqlFOOkniWFahgc/BT53pHW6eQU85vDyPdwX6XTBhlRwu/xr5TbJ+Bziws0GXS07lSFnaT3+OWlwLVFDPISNQl1apCuyzV076W4bSHLzrnE0hVJ+l8pogysfasQyuuXlNl1Dyk6kE0nYfS3GiF08E2dQMDUflq5nEKwBtDfjj74gIj0mJWmkyT8TS6ad+RjUREdGEDExiVOAquItTpLmXEImYgeidhSOH0hgZllkH6xWRfKczaUurtBtiF03LhWuJm2cIyQnTgqzr2/LgIglvXb2Wq9QUh1ZWY1f9C0XyCztOlOjvhyMvesMsk64ObiBFmsegQIXsCvl1WmFAXNL3rDoQOx8wtMnkjO4EIoQaI2KO4h8gCBKl2MoLDhGrQIuuyFOQyzqLhOEb92oWCEFjo7TrCCIU2wv0E9JWHoiry/TpILsDUXmsrvIyuKgeHtJJipy0PB7P/etye3gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(5660300002)(38100700002)(54906003)(508600001)(4326008)(7416002)(53546011)(16576012)(8936002)(36756003)(31696002)(6486002)(966005)(2906002)(956004)(26005)(6916009)(86362001)(8676002)(31686004)(83380400001)(186003)(66476007)(66556008)(2616005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mis0QjFjSnNtazJtUnF0WHRwUEUyUkFPSjF3T2FCWXdmRVIvZWxLcGJkYzVr?=
 =?utf-8?B?RzU1TFptTXdIS0lIajNxbXJuOERwWG1obk9xckJSaHZKVlFVcEJCa20zOFVC?=
 =?utf-8?B?R3RIaEZOL0pwUHQyZFYwKzYreFFhdjNicllHZHBmUGdGVE5UVWZWUTZpY2Qy?=
 =?utf-8?B?T0t1S2ZXdEJ5WDBvQTZLUlhNVkl4YUpjMXVZRlFMOW1WQWhoUlZ1YWoxVHV0?=
 =?utf-8?B?TnBvVGJPM1RyTjdDRVA4QUo2MzZyUkNkSzhHQ1ZxY3FNbjE4RG94QVhqSU1i?=
 =?utf-8?B?bDBSVnRCd1h3eFN6Z3VnbHNLdVdiRXNSRS9SRHZUa0p3cUNZd1UrckJHYTR5?=
 =?utf-8?B?N09mRWdqRHh2UmR1UTZzbXhKYUxqR0JCSGpleDZGcmd6S05XQ2xpMTZKL0N6?=
 =?utf-8?B?N2xkWnorQlZTVVF5YUFDNFFQbXFVb2w0N3BZT0UyL2pWUzRtaG5WYkl3N0k2?=
 =?utf-8?B?Z3hpOFJPU2dLZDNiMXZHQ2VOMFg2NzhneHNWUGVQR2VPQ2ZyR2EzTTNxcmE1?=
 =?utf-8?B?YjU5OTR5SHp4cy9rVUM1STFlMno0TnA5S3hBRHlGcWV4cFRBcXdOOFhDK3RC?=
 =?utf-8?B?d3NVYkhBZStXcExJWVVlcThyVzNQZDVIUHVkUWdmZE80NTlReGFJVmdmdTcv?=
 =?utf-8?B?T01kdEd0QXVHMzM4QnV6d3lyY2UzN2tHeGlvVzNpazJKbk1TTlVxVVlZZEdv?=
 =?utf-8?B?a3JXUURWaGoxU1dnejBoZzdsNmplU0VPSDNYV3pPR3BJRzFaNG82TGFYQ2Vh?=
 =?utf-8?B?U2M3R2QrRjE1VkYrOHB0Q0pDVWRMdFYyd0dqc3Vpb1UvamFmRzE5N3htSkw0?=
 =?utf-8?B?djNrMURjUkN2cDdXSWUvMTZuTWRTNENXYUVqbkpqQnlwd0tsMERaQm1WYTkw?=
 =?utf-8?B?UTM0bkxka0QzeHBJUEhCZ3JpcHRjbGE3cEl3ZUx4WnI3ZUZ4bFdNdUNVdWor?=
 =?utf-8?B?SFRQcjc4MnF1a3FOakxHWGN4YitYWWo0S25KeUtWK09wRDIvcHBSazA0eFJ2?=
 =?utf-8?B?ZFl6M09La2ptTlQyZWs1ZkNpVWgwcy9FQmVobHBpMUx1M1lmZUZEcER0Qmpo?=
 =?utf-8?B?MG9hVDVyb1BaajU1Q29ZZEJML2Y4WEY1Mm1kc3I3VEcxeG1KcENZTUdHYk13?=
 =?utf-8?B?U0s2Rno3QlhKVFNLUzViWmZBRVBwWStOTThHODlJcnNJM0NIUG5ycjBvWml4?=
 =?utf-8?B?eFFhTFVjbWJ2OWY4NzJCenNra1RJcmNHWTM4VW9TTCs2NnBHTnBScTRtcnB3?=
 =?utf-8?B?Skd5WHhXNkRyVTVEc2MxNUo3NHJkemM2MEN4cGIrajd5VFljbS81VWI3VGR0?=
 =?utf-8?B?NVB6WmszV3JGSFIyaWVXTDg4Y2FMazY4VkJtLzIranUxcDAyT1BqMjJQbE0x?=
 =?utf-8?B?dDJsS25ZSXV5QmpkczVSM21CYkFYZGRSVnJQOVJnYVFUT0E2aG1GZEZYV3lt?=
 =?utf-8?B?Wm5IRGZXb0Y1VTJPYW5CY1pKUlBuVFJraCtkakN0SGhOS3VCYWhWTzc4cEdh?=
 =?utf-8?B?UXZxNE1oaHh4bEw4SndQbDJ1cjNaWTJMdVc5VkZad29lZzRsblQwN25seEh4?=
 =?utf-8?B?RUVsZDVrelR6MXNTQzJ1MGJBOGFqNjI5b1dDNis5dXNsVVVCaXN1TTdmRER4?=
 =?utf-8?B?U2xNdE5TTzJoNGZBdEtwd0doRHZ3K2xsejRhNWlUYWRFWXRNZ2RDSGlIRk1T?=
 =?utf-8?B?YTZpWmZHbHN3ZTNBQlBvTGVmcDFoeVQ3RUt0bzBKMTByVWVnclZ5bnkxb0ty?=
 =?utf-8?B?MnZKOFJPS3A0M1IvelNEandzbVlWQjdidHdCeFFSUnJ1V013T3U0ZHRCcS9i?=
 =?utf-8?B?TlI2SThGRHhBZFZrcnJHcWRDdSt3TjhWcjFlYllmZkFkYmVHSkZVUEkxVkYz?=
 =?utf-8?B?SGlhbHBVMTNPNnViMHI2RnlETFNmcXhNZkYwcHlPWk43TE5WZDVKM282TTd1?=
 =?utf-8?B?QUVaRGxMcjFxTnlCQUZIenhrVlNmNStBUEZtd0hzQTNRNm9INGtpanNXSnNQ?=
 =?utf-8?B?WmtvN0ZqUGN2Qkg2OEU5a1owUGJSUW94U0ZqaUVaczdEbExzV2xqdVI3TlEr?=
 =?utf-8?B?bFovdDRqUDJFRUlUS3VDUjlJcUVTUm8xblhvdFJRR0o0a0dldEpSZmphUjhh?=
 =?utf-8?B?enNHekkvYkJ1bWNEb2MrOWdnd2R5QTM0NjluaitubjJUK2N3dUpJZG1NcGRi?=
 =?utf-8?Q?JyG8Ze8Zx+t38raomzi0ULc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8004a1d8-2288-42a0-99d9-08d9a91b7ec8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 16:09:40.7152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+j7MRXuMjryPxGu3eREMsEBzgp1oERYbNJmt1UqjTeNIaxcrcRVGJPLiTTk28gvP4vlVs9T1aklJjDdogagyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 16.11.2021 15:24, Oleksandr Andrushchenko wrote:
> 
> 
> On 16.11.21 16:12, Jan Beulich wrote:
>> On 16.11.2021 14:41, Oleksandr Andrushchenko wrote:
>>>
>>> On 16.11.21 10:23, Oleksandr Andrushchenko wrote:
>>>> On 16.11.21 10:01, Jan Beulich wrote:
>>>>> On 16.11.2021 08:32, Oleksandr Andrushchenko wrote:
>>>>>> On 15.11.21 18:56, Jan Beulich wrote:
>>>>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>>>
>>>>>>>> When a vPCI is removed for a PCI device it is possible that we have
>>>>>>>> scheduled a delayed work for map/unmap operations for that device.
>>>>>>>> For example, the following scenario can illustrate the problem:
>>>>>>>>
>>>>>>>> pci_physdev_op
>>>>>>>>        pci_add_device
>>>>>>>>            init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>>>>>>>>        iommu_add_device <- FAILS
>>>>>>>>        vpci_remove_device -> xfree(pdev->vpci)
>>>>>>>>
>>>>>>>> leave_hypervisor_to_guest
>>>>>>>>        vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
>>>>>>>>
>>>>>>>> For the hardware domain we continue execution as the worse that
>>>>>>>> could happen is that MMIO mappings are left in place when the
>>>>>>>> device has been deassigned
>>>>>>> Is continuing safe in this case? I.e. isn't there the risk of a NULL
>>>>>>> deref?
>>>>>> I think it is safe to continue
>>>>> And why do you think so? I.e. why is there no race for Dom0 when there
>>>>> is one for DomU?
>>>> Well, then we need to use a lock to synchronize the two.
>>>> I guess this needs to be pci devs lock unfortunately
>>> The parties involved in deferred work and its cancellation:
>>>
>>> MMIO trap -> vpci_write -> vpci_cmd_write -> modify_bars -> defer_map
>>>
>>> Arm: leave_hypervisor_to_guest -> check_for_vcpu_work -> vpci_process_pending
>>>
>>> x86: two places -> hvm_do_resume -> vpci_process_pending
>>>
>>> So, both defer_map and vpci_process_pending need to be synchronized with
>>> pcidevs_{lock|unlock).
>> If I was an Arm maintainer, I'm afraid I would object to the pcidevs lock
>> getting used in leave_hypervisor_to_guest.
> I do agree this is really not good, but it seems I am limited in choices.
> @Stefano, @Julien, do you see any better way of doing that?
> 
> We were thinking about introducing a dedicated lock for vpci [1],
> but finally decided to use pcidevs_lock for now

Even that locking model might be too heavyweight for this purpose,
unless an r/w lock was intended. The problem would still be that
all guest exiting would be serialized within a domain. (That's still
better than serializing all guest exiting on the host, of course.)

Jan

> [1] https://lore.kernel.org/all/afe47397-a792-6b0c-0a89-b47c523e50d9@epam.com/
> 


