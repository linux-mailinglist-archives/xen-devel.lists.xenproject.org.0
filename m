Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2F709052
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 09:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536719.835340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzuSZ-0004Vm-5D; Fri, 19 May 2023 07:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536719.835340; Fri, 19 May 2023 07:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzuSZ-0004Tm-2F; Fri, 19 May 2023 07:23:31 +0000
Received: by outflank-mailman (input) for mailman id 536719;
 Fri, 19 May 2023 07:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzuSX-0004Td-Nz
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 07:23:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2071.outbound.protection.outlook.com [40.107.13.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0be520cf-f616-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 09:23:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6876.eurprd04.prod.outlook.com (2603:10a6:10:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 07:22:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 07:22:58 +0000
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
X-Inumbo-ID: 0be520cf-f616-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZ+UKFB4K9aCPllreBIfm+fAymFgDdZOO5V1ZCFBbtHw5SvaA6UedyfSBsI7AfcJsP9wJ1osuutJ42aU3jcPdV3R2c4/I5CukaJoLyV6igBZtvg0PcPiybyzNleRWtuj9XcsO0MY59rqbu86uD6FgHULUL3MJ002ATTB+0GmFHG+0LO+JNtrMp+ymol8D4hf8hSy8OvT8/k+xYpaWQEhWSJyVTPXNEqthCGlqlU+y0+cNkZw2IPOVPz3rS6lyuC44iP1iyYowrZW8XUngj3rK2QuC/VS4EcnVO3c4vwEOrEGMgVcN7Jrnp7japHqWcTLD6/1rREgaPtWhDCGHGvfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBsY3zEC5jAZo3joefLdxCqspcjjKyANbBsqhEwAJug=;
 b=Htax4CMDDTUhlamdUYeIuuCmNOMYYgYHDyV4ACUnfanijxSlKkJVd4Qqt5TwKzIay74EpOlxj/Fl6eSBF1O8Rascl5Bfi2R3FktKvhxnDL78ok1FeJGVuqQVqas6LLhMcQPaYQDEItZGlaswYdRGTz3bYYHJ+WV3DM6oBAPMucu7/wfKbDUZXxL8ekzB26bNjHcR7u0Zon2zTwj0eSe2CxCloeXjm7cMdpdfVkx0BBq571WrAsMo08VEoyrRgJc3N0yA4mKMAhcyfTaG5TEsDAOkiJsJ0pLj42Ua3Q3r5E7KVgRr2Jp/w+LVnDSlbCTa85zaJkJ3cGlYcJXe2vzKCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBsY3zEC5jAZo3joefLdxCqspcjjKyANbBsqhEwAJug=;
 b=QBQvnEkU2OtP8gi5k6k6AIRDr73uwwLU0UD7Lk7VfmYnrXmIL31R8ra1CE7aeo3h6Ym3dey1ZAOJRXMVEaEfihX7Ahiq+IMTWQNu8gk1SJj7RxOvAOOCW6dvjSRwJQAhhI3/EbWEpwGjwFma40igjiaX5wlyA7d5ZRMJB02YpO8rGrHUtp3OMg/PeoVZg/vz/v7ejSICHCdgw5fhhfGm6WHcRntp+x6A6GBuxa4Quflph2mn6TG5c1y4ROHonQ0RNzpBuOMogPocxG3ahYYZnpNsfxJUALnYWivwai16DwHJzPtxjY/0f4GpQPL7IECeKTNyMeUBX9QIdJMqmz3r7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b411f7aa-7fd2-7b1c-1bcd-35b989f528b6@suse.com>
Date: Fri, 19 May 2023 09:22:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: PVH Dom0 related UART failure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 marmarek@invisiblethingslab.com, xenia.ragiadakou@amd.com
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: d2bbdbce-594d-4121-4655-08db5839ded5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UhfjMlLfg+3RVzxMAYGJ1j/hkwoMuyYucWeWZcX01brVdE4WW9qRtBB8yZmEuQi5avwz0Czc9ybqwK+S5DgtLNHwxy0atIyaHyRwot0w845hqEdlPcmpZ2xBKyv/z7RYJt3VbhYeFueR47C+ZIU5hMQp2TpEcKibwByfdyUCpYDB019p8zZYoN/sb5Kn/9n7AN0HSWvuHZOoShZzXrTyDINInlw+GsDF3GoYZvDNKEQyagRHpZOuwoYVRFGXoib2oWmQ6jQYJkP9lTregHW5aiKQMcBzd7rzMe2YMHedjLam6X3i/6myi0XIvqO6urM5ilW+K9qnNBegbkLU2D6us8Wcki0IpPiXBdO6p6bmHmJJM3vAsuOK8OosyPDeGPAmkrMDuC94qceNIYmvdGUFSvMv/54+w6BHonmhW6WT+lEA+DSov3CHMgws/LhuvAnUzAzUgz8uu+u8q8WCkv5kgjOqrte81gWQ+GEwh9JxyGA5cxlNwqxJOJGdgzAC1DRWzskfxDnp+5OzhYvJdV5Ys4Kc0dsj8P5AByt54YicZx2An05p9y+orS1ge+7Y27HUvx5SUYpCpTJNwbxnAFLNahHATFc7NVZXzWyowL7k/vpySqHJrhdejUzaKsWlRnpdgp4mAUMARI4HbfYvKKXORg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(31696002)(86362001)(4326008)(36756003)(110136005)(316002)(966005)(66946007)(66476007)(478600001)(66556008)(6486002)(8936002)(2906002)(8676002)(5660300002)(38100700002)(41300700001)(53546011)(6506007)(83380400001)(6512007)(186003)(26005)(2616005)(66899021)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkFwNS8zSG9aYjZqME13alNhaVJsa2szaWx6MHdSQlVlUjhDUHlFSm5id096?=
 =?utf-8?B?NDFlMDZXbFFuaFp3bVhTU1kwakZvdGhMdHF0T3ZQRnZDL0poeU85SE1vSmlt?=
 =?utf-8?B?WWNTSzZiTXVoTnJJUlZBUUd6VTg0OUwyRU4zcUdyZkxUZmFmYm1HNTFkNytY?=
 =?utf-8?B?Ulc3SFJBTlBnYlgzN1l1M0hPQmhpdU9QbkdPTC9CbDlpZ2Vqc000WktDdXVT?=
 =?utf-8?B?c1BuMFVlY1NOblJWTjV0bHBOTWNMUDJIamFVTjErei9RRVdZbW5KTEVqNnNh?=
 =?utf-8?B?TE5WMU5wM3NWNVBFcS8wRjIyQmNmQzRpUnVaSExvekI5aVo2QVplMU1obk1X?=
 =?utf-8?B?MTAzT0p2M2p2ditScU01QmpMc1ByUGlLYnd0Z3ZYbEhtYmV1VWFkeU9QSUNG?=
 =?utf-8?B?em1rQkRPVk5Ea1hFSEpNbC9jMUdVckwrSmI2MWhkMzFzU1JoOW43c2NTRVBl?=
 =?utf-8?B?TVhuY3hrSGJzWDdOWVV5R203NEw1UGEvaVFQK2lUQzVGSDFRR2IxZG5oV2lH?=
 =?utf-8?B?YnByemlxQWZiR1hNa1pwT1JVelY1SlFYWjhjbk1OQjF0ei9QS2FBMlVLTmpz?=
 =?utf-8?B?YUlTcHgwWFFyY3hKNXQ4ei8rU0lmSlR3REZpRzgzNTZ0a2JHQ2p3NTUxbG5O?=
 =?utf-8?B?NysraFpMdnp3QjlBRXcxSHM1c3Izbk4zbXlwd2pkeUtlQUJnRkgvK28zN3lT?=
 =?utf-8?B?ZCszNzFFY2xNbFgxZXVOUDRSK1BXK0lwRXBhSlZua3NZVGkzZWxQOXNXV0lO?=
 =?utf-8?B?eFdjMHUyWEk0RUpvcjZoTXNWcitmb2Rtb24wYjhuMHBXN1hHUWN5Q2tNVmdL?=
 =?utf-8?B?MUl4NnVhV0dCdHlidGVtd2VNMHkzWjdtZ1VWbWlWSitSOVFMaGN3cEFjSzNK?=
 =?utf-8?B?SGdXV1dQYXpDaWtZanhTbFhYekVhalRtd0JXcTdWVmx4N1BhemRpZVM5ZlNx?=
 =?utf-8?B?OEpNU1ZLZGgvSGFMZnZnRGsxV3BJa1c4Z0dla01ZV0lQTWdKdmtudVVSOEhu?=
 =?utf-8?B?b2EvekxUMUNITHRSdHhRM0FHY0tnNUcvWjJGaEpQOHA0Qkp1d3I1bk85YXFX?=
 =?utf-8?B?RFg0OWtuOGNRN2JsTks3bmZ3eUxDYmdJcTU4eTI3bTZ0bmZuZUR0cDVoNHJq?=
 =?utf-8?B?cnlnaktvdWFzcjdDUGdhZ0VDa1FpSjBzejdTRTA1Q2RJQVUxL0pXc2NxVDFt?=
 =?utf-8?B?V1hYaWRyQjRVbms3WlhHVi90SzZibmVXYWtDNDl1M2pObGxoRmJJRWVwQitY?=
 =?utf-8?B?OFdCUnREek5HaVlEQyttVkxHVWlaazVVSUpFZFVkOW9ZeDI2ZXdZaGdzVmg0?=
 =?utf-8?B?Z2x0OFFNbVhBaEdUSjNXMjF0REVlN0h1ZVNOSEE0Yis5dEJOdllJeXpndGVi?=
 =?utf-8?B?K0JNcGM1VWUzdDY5MkJ3ejB2VGxyZzQ3ek9TdkZLK29wbFhjVVlVQ05tRzFU?=
 =?utf-8?B?N0Q0QUNrc1BBTUFDMXFLR1FHVGxMUVNTeDdpSDZwY2RGM0NQTCtQZVhveWxl?=
 =?utf-8?B?YnltZ201Ky9ybWtDNUJwaDNrVnFocXRPMVFEaThXLy94Z3pJTjNSQk1zcEpo?=
 =?utf-8?B?cURwdmt0dW1DMUh6TmNGKzBjdFJoNUpXS0VhOUxERlpRbTdIdHpnT0xEbUc0?=
 =?utf-8?B?VXhERHhuZjFZQVhXbmxzRktXdkFkaHVZdkFDSVAwMHc2aGFPQjdVSXNsQklK?=
 =?utf-8?B?OVNPWG9tRy9kZ09PaE1EUlhaTUo4bVNIVzc0dGRqN2ZYTFhpaWJIUkZSbUZy?=
 =?utf-8?B?QUI1UTJvaXA4amx5MTluOXBFZ0VGU1ZJSFJIVXlFcjJ6N2N4NFU5WkxENmJz?=
 =?utf-8?B?b3F5UG5DQTN6MS9UaENwOFhCUHZka3VRdkZYVEFDRjBzeWJLMElNUHIwOVV0?=
 =?utf-8?B?ZHM4eEZ5SWJIM3YwUGpJcXEwd2liT2paTmYrK2hBK0k1WTNKOEtkUUI1L0V5?=
 =?utf-8?B?NFh4V2orQXFjcjNlTjhyWVBQeDJ2Vm4wMUZWSjVBeklDa3lyVDI3VktkMFVs?=
 =?utf-8?B?NWV5MEZFV2ltTWRiU1ZUOExPczdIY1AveGFIRDFqOHBXUExodGJLdTRRUktk?=
 =?utf-8?B?OW1uVVZWaVNTeS94K2xtQlJ0Z2l3ZXJ5VFFqaE15OTNDcUJHbWFsTGpqN0lq?=
 =?utf-8?Q?ay2AYYjy8KYqxSzEqBTjotTql?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bbdbce-594d-4121-4655-08db5839ded5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 07:22:58.0296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KB3JuqdI9iSD/UBiA0BEAtEy4m6rFb13ul7sxrIDFLJwtE4kVUfM5fNbhfkY7LS6ASu9lFmjyjUg9bHf9J5xRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6876

On 18.05.2023 12:34, Roger Pau Monné wrote:
> On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
>> I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
>> test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
>> Zen3 system and we already have a few successful tests with it, see
>> automation/gitlab-ci/test.yaml.
>>
>> We managed to narrow down the issue to a console problem. We are
>> currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
>> options, it works with PV Dom0 and it is using a PCI UART card.
>>
>> In the case of Dom0 PVH:
>> - it works without console=com1
>> - it works with console=com1 and with the patch appended below
>> - it doesn't work otherwise and crashes with this error:
>> https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> 
> Jan also noticed this, and we have a ticket for it in gitlab:
> 
> https://gitlab.com/xen-project/xen/-/issues/85
> 
>> What is the right way to fix it?
> 
> I think the right fix is to simply avoid hidden devices from being
> handled by vPCI, in any case such devices won't work propewrly with
> vPCI because they are in use by Xen, and so any cached information by
> vPCI is likely to become stable as Xen can modify the device without
> vPCI noticing.
> 
> I think the chunk below should help.  It's not clear to me however how
> hidden devices should be handled, is the intention to completely hide
> such devices from dom0?

No, Dom0 should still be able to see them in a (mostly) r/o fashion.
Hence my earlier RFC patch making vPCI actually deal with them.

Jan

