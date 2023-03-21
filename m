Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3386C31A9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 13:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512590.792565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peb3p-0000w7-0q; Tue, 21 Mar 2023 12:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512590.792565; Tue, 21 Mar 2023 12:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peb3o-0000uQ-U7; Tue, 21 Mar 2023 12:25:52 +0000
Received: by outflank-mailman (input) for mailman id 512590;
 Tue, 21 Mar 2023 12:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peb3m-0000uF-Qr
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 12:25:51 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe12::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 835ebe2d-c7e3-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 13:25:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 12:25:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 12:25:47 +0000
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
X-Inumbo-ID: 835ebe2d-c7e3-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+2HSoMlMzUiWrR8nrt0T/+WgDfROa/EcolIVp/36e6W5p7wIUWOCDJY6CDr81SJOdfiH78QsV7r3g2srr7J8pA87+xJuRf/lisH8jLjPR1fkwetRdDoCMcANibPlkqz9HcJkJtSsXvtjjM5z5ZxXmTSd9QJJOENw4zuOOfdCk2DkIqpGOc+WH0XSGUN0Q1utnNHl1iBQGml8NBLILieA45ZKv/Mq5ElTWUjvkb4xQfG1zfF+ZiJrDnESiLvNOF1eQy6vjk6w3JvXGDeZF4jClJ8wboZ761l4X4vAUU/snLz93NmT4EJ4Kncwva4y6RQ6Qf0giiOykLmGF15NsTYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlIaqC24WMIFu8eL1diLFlepMfSKBdYGNtCaSxkvIYA=;
 b=kjTwffTMAX1cEEmQjG7Yo040QFawN4xb2NA4uGOnIQyHr80SH3AmgcnQ/rchcjSS4EsPi6T82muEc5P33RC1EIICyUvhqz8brjvEFsNS0mAft3ZsqxpnIGYLTgcW43Held6d/vESbxYodOVVLzN5Osvq4Lr4EVGHnRRpVPb+fufdnjp2WBjVB0D4Oz7j3yluoFLM7527DQraqGXJD4O2H5p3p5VScWAeyEWt4deh8ZxKJVYmAtqAONr9eN18y7uKhA9FMwAOs5tu5Rug8GBDxD9t02yXiuVf0luLwMjc7BnjSNVEidVuWyWmfYucsYdmCp+/TKAiwndYRLkPwMlXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlIaqC24WMIFu8eL1diLFlepMfSKBdYGNtCaSxkvIYA=;
 b=vTz1kGAaEPe2XOEZH3LjkwRXuSH+B+Yug2BVcnEbFVO/qbS3PRHJVuC/jXaDeawnaYatV4bAPe+pH14i4C5pzbQQKaKts92jfYf/0eO3wCqTjpM/N9i648XluP07NpKoMqNTTWVwD82Om5OL4BcFZlfhasoGpXHpbwM1AzAxtp8Cr7XYoVq/f9p36EoD3zXpA4hIAuPlOTBMWK3xMfOrrz6XhDMcrBwLnIT0WmR2UhKl58VBPOaRWt0iJoTyllWgKKy+5L2fKHyiGLipVxuAd8QWvGXJKQCrBrNJX26y4ODBp/3Z3CHnGA0lkxlDlDQpFAwaniUruUZTE8HVu+bBsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <820e1aff-a6a8-83c0-c4ae-82c6cf903192@suse.com>
Date: Tue, 21 Mar 2023 13:25:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Huang Rui <ray.huang@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com> <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com> <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com> <ZBmZxnyZWrni57Ry@amd.com>
 <ZBmhJfBPtdLPi7X/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBmhJfBPtdLPi7X/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: c8db8544-1e1f-42d1-0361-08db2a076625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1P0kqCKsGGa8z6PdnpxaVUvXy6ETjruBdmUru3e+F68YdO7mC9of0Ehn8v+XsekvlyHc2QW+M8du37iL++0QMpKGwRvibIfxtTmbH10IwE7U4MdzCWT8SK/WhxJs7Pb6/VD6fTk99yRLFrnk/re7YluRbzY1nAsVgnLeCQr6EHgWRBNEjfJt4xYaZYUgtKazrbAWhUXhSQT8wQIMAJAHkDKvsZl3ueVMI6m7IPZlz30d9In/v6jurYhyzRMd7WKLumJfjgSFaBz3KoEV4L/yl3SmUOiSmh/CFr9CX9U++B7KLW5i6D/33/zF658Te9qTqKUv9Cm5PkuRQymia/h/gPMgQhsXJiJHmFdMgS2CfQwu8VMmbN8F1N6eesAdN+9ac0Hgzj1pjLATl0l9tAFNdZHTrBhHUM6IYZ7HObtwXmXLTCk5Cdq9xDz9GgBZ/Z7D7CcwBvP8CLnSibHYFDzBlmPrjp6cQ22m2Y4DBYNVUqWiCSIt1n9PLLEZWcaQFuvEUS+Dtpq5NnYO8cn+i5J1k04r7hYbvzlJMPaCgLIN3Ya9Rw5/mN8q+fbwB83fbcJS7FNw0i6WZfZ9eb+8Ldf+bdi5sc0ETp+wJkbBsIss8YgO2EABVGLt2mtP46L4J669TteoiRG/7Inp8/IyULRWzCAtGC/CE7Xust9vcaRLIjrAuVv4FXAbbdn2Xj7KltAi1zZNZ6E+yB9cKmUuWrT5J8UBIqTDRpfgdQ5FiMsu1z4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199018)(6486002)(31686004)(41300700001)(54906003)(66476007)(66556008)(7416002)(6916009)(478600001)(66946007)(5660300002)(316002)(8936002)(8676002)(4326008)(36756003)(31696002)(86362001)(6512007)(53546011)(6506007)(186003)(26005)(2616005)(2906002)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0JhZk9WejNhcWN4NGdHOGVFa0l4enBiaTlqN2hraVRQZS9DSXZITjJMaEZB?=
 =?utf-8?B?L1cwME5adTlDVXVuSFZpV21NbnhXRDB5WEdzTW9iWWRYUy9CVS8zcGRGWFR0?=
 =?utf-8?B?ZVNTUlJpb0lqdGxSWmhzZVE1T0JjaVU0TEJJa1BHbmtoc1FRNTcveWFZWTJo?=
 =?utf-8?B?K2t2VWFpTE4wM0hNOTZESWtxYitGVHNZN3FCekg3Rm94ZFhLYWdJbEkvcHph?=
 =?utf-8?B?eHpLWk9xWjZ4V1F2elVOditpOUNSc2Q3Sk10dlFidCtJVWErQWIweDhmYkNR?=
 =?utf-8?B?UHR0RHRqU2JSU1g5TXZEajBpYTltV0xLWVozZVlPb282ekUveE9sLzRHNC9o?=
 =?utf-8?B?S1BFbU1VZUZJOVZmRXd4bTM3MVJ4OHlNZjJBTGN3M2x3VkxGUHo2VlNYNkMz?=
 =?utf-8?B?KzZpRVUyUjZPS1RmMUxTMlVKaWZUNWV3QXZmQWNqaTlFM2htWEhwTkFFT1FX?=
 =?utf-8?B?QXpZRFJrRllGOXFjM0htSnFMSk1hcjdSY0JhMEwybE5LOEwzM3BnanBDQnR0?=
 =?utf-8?B?dFpLVmNXdlNMRzEzS3E2ZFBQZGZ2VVZ1SVAwQzk4c1QzVGg3bkQ4Yk1xdGtI?=
 =?utf-8?B?MTI3bGdXbjJzVUZ6MkpSVEswb25xOHZsdGlsMWpWVkxQV2RBRkhEMFBzQ1Rw?=
 =?utf-8?B?dHJLVDNwMzF5YVlEaGszcnFWMmgyOTJWZmZKWE1xRVpuZzlTanFscjR0QnZU?=
 =?utf-8?B?dmFJbzNsSG5Kai9ZN3E5V1E2QnpyYklhVllMdXVUblZjWnhvSzZpTEJkRm54?=
 =?utf-8?B?UzFCZmFCQ0UrZDBXY04wTk1NMFBrYytmWVdObnlVVEZtbHYxVEpwakU1V0or?=
 =?utf-8?B?QWhadndUdnFEQTd6OXcyem8xQ2IweDdzblVVckRlS3BpZFRaTW5WaW9kU2Nk?=
 =?utf-8?B?RVFFRTNUUzFhVzV1YWY5bCsxaWRZMm9tZGlPMCtLRVdoZlY4OS82dFVlWHNk?=
 =?utf-8?B?QTEwdlNtMHZWODdEU2NLSERNd3JaUHlZV04ySGNKNjliekRUZFBueW5nWkFw?=
 =?utf-8?B?bUY3V3RVcUdPVVlaWVRMTzU3djg0OHBMZ250OGN5NWpMNFRPQ3NoNEV5aFd5?=
 =?utf-8?B?UHdDenR5N2hCcUJjeEVBS1lLRnY0Szl0Ti9Fc05hdUwxaU9PVUhST3VNakRy?=
 =?utf-8?B?R0FoenVZb1djY0tRN0NXY2lLQnNYSHhrUEd1QXBEYUFVVnc4Q2c5UVl2eXNP?=
 =?utf-8?B?K1lyRFhDaUFydUlQWFovQS9zZ3VVR0JINTBzQklmY2M3YUVwVHJkYisxcXIv?=
 =?utf-8?B?QkN2OHlQVFVXc3Q2cmU5Y0lidk5XM2lLQ0I2WE1NanBvYTlnWGg5OEJ6Q3cw?=
 =?utf-8?B?SlNHVENQekxnTkd4ckhxOWM5RDBYTEF3cExqSkYydm5VVzNIOUxkVjVnR1hZ?=
 =?utf-8?B?TUEvYytCeWZ3V3JwcmdYNmFRdG9BM3V2U3BGTGpObDlHTWhReDZVWkNFV0hU?=
 =?utf-8?B?OWNkZURQTzFDWVp5K2R3a1NXU0IrTnd1ZkdGUm9hcEUxblhqa2dMUENZODNs?=
 =?utf-8?B?RXcyZUREaEhndHUzTTluaFBBNW9xR2IydGtoUWd3eWNPL0MvNGIvbFF6SERu?=
 =?utf-8?B?N3ZzeWNjRVZ6bGpMbzltVXpaNmFiektva0kzUysvdjlGSmlxTXBuaitQb0xn?=
 =?utf-8?B?SzF3enhwSTN1azg5Zis2US9qTzAzMXluYW5MTFdHL2tjU2xoMzBUSkNLK1E4?=
 =?utf-8?B?UUd1cXl4ay8yQ1FTN1FBeHZDZFhGTkhrcEVmUFJhcEY3RFpqbmZra1I0a09v?=
 =?utf-8?B?Q0dMZ09nNW0xaitJazVtV0VMY0FMWE1CV1hGdmFmdjN3VWNHKzhNMFgyQmhS?=
 =?utf-8?B?d2tQWHEyYXd6dXNMUzJycHpIRmVUMGRacVVZWW5uSE5TTDN5S2c3SGhoVXRW?=
 =?utf-8?B?eEJ6ZHgxYmJ0ZDErY0FjRU83RTJtUmtiS1d3YncvdnQ3elNiZGpYRFdiNS80?=
 =?utf-8?B?dGVwY0NpUlRneVBxYytlYXNiSnNtTDM1VlIxamdlRk9JWFlBMkJtMjdVVTBa?=
 =?utf-8?B?RHpnWFhQenRNK1ZMbGRUNmJzWUdYRVdsZmV0cEpKQnZ6dlVKenpnU0doVzVL?=
 =?utf-8?B?Uy8wcHluYlhUajIvVDR5b085blE3aEx5ZzhKcDlZY3dha2Ztck9qZUZVZkd4?=
 =?utf-8?Q?SzNlXKtCj2jFzhzbvVfeGq3xj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8db8544-1e1f-42d1-0361-08db2a076625
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 12:25:47.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qc9SSrWreGufCLOp8m1n2Y9/CNhcLR6+NESr0XkTAKARc/rNIqqcZ/7LFZJQzQa3jNI8bntkfAlRGe+9agCw6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802

On 21.03.2023 13:20, Roger Pau Monné wrote:
> On Tue, Mar 21, 2023 at 07:49:26PM +0800, Huang Rui wrote:
>> On Tue, Mar 21, 2023 at 06:20:03PM +0800, Jan Beulich wrote:
>>> On 21.03.2023 11:14, Huang Rui wrote:
>>>> On Tue, Mar 21, 2023 at 05:41:57PM +0800, Jan Beulich wrote:
>>>>> On 21.03.2023 10:36, Huang Rui wrote:
>>>>>> On Wed, Mar 15, 2023 at 12:02:35AM +0800, Jan Beulich wrote:
>>>>>>> On 12.03.2023 08:54, Huang Rui wrote:
>>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>>> @@ -392,7 +392,7 @@ static void cf_check bar_write(
>>>>>>>>       * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
>>>>>>>>       * writes as long as the BAR is not mapped into the p2m.
>>>>>>>>       */
>>>>>>>> -    if ( bar->enabled )
>>>>>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>>>>>>>      {
>>>>>>>>          /* If the value written is the current one avoid printing a warning. */
>>>>>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>>>>>>
>>>>>>> ... bar->enabled doesn't properly reflect the necessary state? It
>>>>>>> generally shouldn't be necessary to look at the physical device's
>>>>>>> state here.
>>>>>>>
>>>>>>> Furthermore when you make a change in a case like this, the
>>>>>>> accompanying comment also needs updating (which might have clarified
>>>>>>> what, if anything, has been wrong).
>>>>>>>
>>>>>>
>>>>>> That is the problem that we start domU at the first time, the enable flag
>>>>>> will be set while the passthrough device would like to write the real pcie
>>>>>> bar on the host.
>>>>>
>>>>> A pass-through device (i.e. one already owned by a DomU) should never
>>>>> be allowed to write to the real BAR. But it's not clear whether I'm not
>>>>> misinterpreting what you said ...
>>>>>
>>>>
>>>> OK. Thanks to clarify this. May I know how does a passthrough device modify
>>>> pci bar with correct behavior on Xen?
>>>
>>> A pass-through device may write to the virtual BAR, changing where in its
>>> own memory space the MMIO range appears. But it cannot (and may not) alter
>>> where in host memory space the (physical) MMIO range appears.
>>>
>>
>> Thanks, but we found if dom0 is PV domain, the passthrough device will
>> access this function to write the real bar.
> 
> I'm very confused now, are you trying to use vPCI with HVM domains?
> 
> As I understood it you are attempting to enable PCI passthrough for
> HVM guests from a PVH dom0, but now you say your dom0 is PV?

I didn't read it like this. Instead my way of understanding the reply
is that they try to mimic on PVH Dom0 what they observe on PV Dom0.

Jan

