Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C32416CEC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 09:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194970.347391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTfm3-0003xR-K1; Fri, 24 Sep 2021 07:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194970.347391; Fri, 24 Sep 2021 07:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTfm3-0003vH-Gz; Fri, 24 Sep 2021 07:37:35 +0000
Received: by outflank-mailman (input) for mailman id 194970;
 Fri, 24 Sep 2021 07:37:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTfm2-0003vB-Bu
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 07:37:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4715872a-1d0a-11ec-baad-12813bfff9fa;
 Fri, 24 Sep 2021 07:37:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-fedGMrEWM1-uD9vl32jFeQ-1;
 Fri, 24 Sep 2021 09:37:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 24 Sep
 2021 07:37:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 07:37:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Fri, 24 Sep 2021 07:37:27 +0000
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
X-Inumbo-ID: 4715872a-1d0a-11ec-baad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632469051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzFNDGGnURHa/AMypY4IXW+8W1K9iX4ncP8x+aBrxjs=;
	b=RI6a56l/rD5qOSKwD5Yc0rCvTjc6E9lnGyrQ4Mv6vS73fucQ09pQoGLFMMSV0spcYIZZVN
	BGRI8Dloi9xGHBhYvx0E78HJFMY5hWM9bWg6qHtY2+i7IKjGPdNuKq+V/4H0Rpaac3AR/w
	MdPEygpu1dWHvIVVsDbXp+cLoziq3g4=
X-MC-Unique: fedGMrEWM1-uD9vl32jFeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9vor3GkLNun6PMy0wBOo4kMeDI9IdMe/gK55SN3ACJmdLOQ4yBVaLSfgv6+F0czbE7nW28UBMYMGWybEQ8KZfEv6G3zLHIbCbGQEIPBCWXc7tLoIJZCFGE2KIo13nY8h1T0EcwlyiLwhyMninEOMcbNlK8idaoSR9zb24VwNNQEdrddf3IjiMGxMLke9R0ZVbdCCWifsdHIaqhrrumYpauSAERRUFNSBskDNLyiMCTzFHPFVGQjujbfa9cW0yPKrUppxIEP5a3tWuIXAU+rd89sjEBs/vWEdhZeqYvpz1477qTsDSQjVrppO+N/MwNRHrMT5kDXgG/F2KeG2Cviuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kzFNDGGnURHa/AMypY4IXW+8W1K9iX4ncP8x+aBrxjs=;
 b=PfsbrPUqi0rfQ1Hbfxqyqzku+MNFqKaWKtoXLb1Ep1G0u/36Id8GcbRjGniQQLTemJs0IB5adu1HBTqgh/QVji985FIbAGg5n1fV2CjoMQzHG94BQFl3gVZrsqsWxPIX2RIs1eQU9yUQGhzCRrZjn3ATeTOOEMEf1HMqmEfpcD9SpIAL1GpwnGoxe/XZ80NWZfLUByGXl1pykQ5NN5khXMCm2hh9Pi9jBi+a1qPzigH53GXa9M2VNJATIKNXWrGM2feI6iLQnMSBZmMo3g0xQsLNYzlMA/mes1YpEIEvvOsic4bcCHtY+6YU6ammgxfUAvmf/h9PR2n4REEvHB5RrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <06e0cf146ca4d82526282c1960177fad97346ad5.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221926410.17979@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f4ef734-3218-1f4d-7fd7-445820ad9f79@suse.com>
Date: Fri, 24 Sep 2021 09:37:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109221926410.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e8c1872-cc18-4176-5077-08d97f2e28e5
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2336A648730A282E868F98F9B3A49@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n4qhCLzrpCxIoL2+TanNaU71Esa7ntP3xv6JcIBzNfnKsya6H4wCKRQEOcoqi9XB4bzry72pycriL6kftk3oCYdB2Sc5R8TAGmN4PT00ExlMUiPBl6IVwqH/mYnrt+fyZrPL37Umj3bxIFLQiJb/LfPltrIvz43XjcY6KsaBkWGh+Z+kuXQNLKgKQgPdI+NrwU+04ExTvHKFp6fBb5lm+6otufbXQL7AorPeI8T+MwDPRrOTh3Z7wucZ13NIZUEOvuBP+3ZuAjNxFH0s2ovUZ2Hc7t4Askrn7QxyLw0Z4R/7cebwDwXMLHK/X2/PaS+m1p4cxihb1t4eJCVacDajTuqOrT5oZYkMhcaT3tWlvsmRRNWS01Nm6p8HsmJ7g0E2uzngKB2e6Hsh0aeFxLP/ywDWL2Ph4KWoFgcX7B3Ywj4NqWxcJ57s7SnUUVQOpJchQgGddRpAlk0DDHQD+lbVkcMLk671iaZq5fhOQxcybVbAGSoRajU9JfjaLEQ6kggQ0gZLvyyWCnyCQH3XyZguHXSWdlttFKtBMW2G/k7n9mHP9t/zjRZ43iO1U4+9FlbCvQQvz9PDKHgBpnOCdHFwn4zMlvg20A5N+LSMNOY6Xczby/hcVSJ/UaX8rfD+YfO9jjo/op0ChzT2MsaaOfbmlwtvHgqeur3TuWa16R4Sh+nuTCE7LfaR7UxRmeqn+5CMb20IuyS9n+I7JEZjSL6IXcdaYIyw791nR40jnFHVGL8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(110136005)(2616005)(5660300002)(4326008)(66556008)(54906003)(316002)(8936002)(83380400001)(86362001)(8676002)(956004)(508600001)(66946007)(7416002)(38100700002)(31696002)(6486002)(53546011)(186003)(26005)(36756003)(31686004)(66476007)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDBnZjV6SlBMRVpDKzNkSnhQSnRSMWJGWnZRU0R1MlRCTmdUazF5cCtZbXBt?=
 =?utf-8?B?OExLdkRyYWo4ZDdTbDB5M29JTnB0ZHg4Rmw5S0pqaDlidHBFMVRVOTczeHlW?=
 =?utf-8?B?Qy81Zk5ycHBMdzVnSEU5azNveXFLcTNyVWdHRk1abE45eWVyM2R3UWVHL09z?=
 =?utf-8?B?TVVxZU9TZ25aaUpBNHUwczU0aG93aWhPMkZaYWlXRklPMHliTGdJSGJHckdH?=
 =?utf-8?B?dzNyN0cyaWJlVTVUc1pYb21vcDA4dS9lUWhzWHlCTmw1c09VczNhM2NQY1Ft?=
 =?utf-8?B?WHFHUlltYnozYTkxbk5kM0J3OWU4aEJYWTU4VjI2Q3FmKzdMZERIblBYUE02?=
 =?utf-8?B?Q3h3V3dQbEYvcTN3Y2QySzErL2JQMzFac1d6YnBEWlNldk5WaVR0MkxESmk3?=
 =?utf-8?B?RmJmRjQyNlBhOHZ0bXFKWllsTVhOTTdBRHhDeTJBOEhDdEtiTUJZdzlzR0Er?=
 =?utf-8?B?dzN3ZlBpd2RlcE5oVi9KRFY1ZWFtMlA4dG5SdFphKzR1TUpsN1JWcEsrRG1m?=
 =?utf-8?B?Mjg0Y2tFYWNrcGhNYjVubXlDUERudDlqR2ZkcGEwcXFDa3hROVZrTlg4ODVC?=
 =?utf-8?B?L0E1aTY5NVhoRjdXSzh6dVRQRWVxRnZqSFMxSHA1MWdsdUhUU1M4TFlhV1Iy?=
 =?utf-8?B?cUE5L3d1Q01TRGJsWHR6c1Y0a3d0Zk1hYlJoSHdMSlduZTVsTlF6YW83Q3lD?=
 =?utf-8?B?Nk9MYXRmSnJZaTZIK3dOcURaMFZIQ2VvOWRpbG5wTGtFcFlmNzliRDU2OGNk?=
 =?utf-8?B?Rm1rcmtHZ0VlaVJobGt0TlhCcGFIRHEwbnhIcjJZUzNvMWxvTmdkWHp4MnhJ?=
 =?utf-8?B?QzRhMnB1VGc1RXB0MzFiYVNWMFdZeTV2bTdaZDlCY0liM1Z0RTg1MGdHU0NV?=
 =?utf-8?B?UG9UL3IxL0hGNVpHYk1Lbk9UMGVzeUZTb0UwbnlOZ2twRHF1d1BGV050Q3R3?=
 =?utf-8?B?ZUpicEc4bXJjMURWYW4vOUNNRndPTzNRZDRuMnV2KzFKNHVVbitxUytxTnl6?=
 =?utf-8?B?emw5WER4VEtSK1RFWDg2d1JxRXdtM25ReFg5ZTFoTThvdDQ0NjlVVG9nakVU?=
 =?utf-8?B?am1DTHF6S1RBZzB0NmxGbkkzMDhPdWUxU09EMVJxWGZySmZoWE43ZWlpaXZM?=
 =?utf-8?B?cXdWUWZSTmhET0s1Uk43c3d1OUNIMTI5TXgvNlc2eS9tZVoxMXppTC82MGFI?=
 =?utf-8?B?T2tHWmV5bEZQL0g0VzBoQ0xaL0p5MjNUMk1yMWdvcFhuMiswd2w5cExvejF0?=
 =?utf-8?B?RGk3b2Y0Y0FIRk9nZ3cvejgyWmVYUnhNMkhWUS9YVkRZbFNuc2hWM1dtOHRE?=
 =?utf-8?B?ejQyenJRZ05Sc042QUtpbWloeVpqbjZwNlpUd3FGdll0bUY0dEdBb2ZZNWNO?=
 =?utf-8?B?Vm4zYVR6SnMwL3loWTNPR0YwcmpXVnpKTUtnZXVSL1IyWGR6bDVEMWtYSjdI?=
 =?utf-8?B?ZHJTZTk0MHZGQXdnRjk3Z2xBUEdNamEwcVVlWHRFUW1BSHRKaEwvdUd4LzdL?=
 =?utf-8?B?QTRvNUZlK1NoY2RoMHN6Yk9BcXlJU243MkcyczRQcTJjenZMbHIzaHYzR0Zj?=
 =?utf-8?B?aWQyV0tPQ2J6MjZvejNreXAwcExWNyt3clVmSnRyYmpwcXpSL3owcmpxbzRZ?=
 =?utf-8?B?M0Rwc1drU3gwbUorZVgyQWlXM2I5MCsydmlyemVSOVhoNXJpS1owWHZxd0FW?=
 =?utf-8?B?WlZzS0dxSEhYbWwzL01oUjJXSGlUNUxCN29jbDhMYlQ1V1RMSk1xaldUSWJL?=
 =?utf-8?Q?2KdlUCE9i+Ye9xxVR7o0YPDoj4oCzSKa0M5WxY8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8c1872-cc18-4176-5077-08d97f2e28e5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 07:37:28.2545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJDTH0XyaSjGvBRi0+/ArsmjRGkJbXGCS0svxnXtetPjYxx2BGB91MKVjduHIMxtR7hfwtmer6QFybitkrOljQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 23.09.2021 04:41, Stefano Stabellini wrote:
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -767,6 +767,18 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>      else
>>          iommu_enable_device(pdev);
>>  
>> +#ifdef CONFIG_ARM
>> +    /*
>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>> +     */
> 
> I take this is not needed on x86 because for vpci is only used by Dom0
> PVH?  It would be good to clarify either way.

I'd prefer if x86'es present vPCI restriction to Dom0 would not be
baked into any new code additions, if avoidable. Furthermore I'm
not convinced there's a connection here. Instead the question is
purely how Xen learns of PCI devices, which is information I surely
expect to never come from a DomU.

Just recently we've discussed the hotplug aspect on x86: While Xen
scans the bus during boot, it has to rely on Dom0 for hotplugged
devices. Hence Dom0 even there needs to notify Xen of new devices
(see "x86/PVH: permit more physdevop-s to be used by Dom0"). So
there will need to be a 2nd place to add handlers for x86 as well.
Which means preferably the change here would cover x86, too. Which
in turn means re-registration of handlers needs somehow dealing
with (either by making the call here conditional, or by making the
function itself spot the case, or by lower layer functions being
tolerant of finding a handler already in place).

Jan


