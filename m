Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E87A49856
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 12:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898652.1307167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnyb4-0002yx-M0; Fri, 28 Feb 2025 11:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898652.1307167; Fri, 28 Feb 2025 11:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnyb4-0002wW-J3; Fri, 28 Feb 2025 11:32:02 +0000
Received: by outflank-mailman (input) for mailman id 898652;
 Fri, 28 Feb 2025 11:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXoc=VT=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tnyb3-0002wQ-1A
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 11:32:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2612::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a954743-f5c7-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 12:31:51 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI1PR03MB6480.eurprd03.prod.outlook.com
 (2603:10a6:800:194::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 11:31:48 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 11:31:48 +0000
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
X-Inumbo-ID: 9a954743-f5c7-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYj8EiEzjOnJboYU2IrYXduuYZCI2nwaluvlMB+Xp8SBi9C2JjAZ2+yfuG14cjMkNZiu7xlydoyMQuutbvm/VezvNUJ0t2RE1b10f8i+IUq6B4CrYQV5YUah08BX3M/oTBlMnZV9/9Ya8q5NMOtX4J9IjR3mKL4T0trow3zXLomfEGUt2lEjRABuS8cjHMcAl8J3jcQPsukDo9P7gz4MN8UwNAH05Ar7Jm7Ts2QbWfle6aOocp//zBKWet1+q1keYM6XC+eBLWyDske3coEuuff8AnrLi5Oc9i8DC0eDliylTAV49c+kMSIWOGenRGSlCPn+4FDNhmezbzeXUS9ZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/O4EF1X7IwN+wEDSXSOMuY3xHn0dNJGCmEjFPphIAg=;
 b=tESIyQ7OKXwo0VtiYixls9OXD/Wq4JuV78VlYJgMduy9AX16xd4i60mz5HG8f7B88J3STPpnTZCFeYyS5Sn2WmV1sg/qaa73gmRqinROsDeXzma+eHy9I1h/RzGgSayRncuioHhoJIoql9mgC82Y6LjRkpM68beF1HRGkagPs3hq/u/Ozujagpl2q1AahdjS0jB19LiN9F+OlZoHfXNySJig6FJD2uWSgHpnTNjK4IbG5Yg4CPRVsOl1PJDGc78th+hhvRleWRY2iJgdm7wA4KEE1Z9Z5NViSkw8VBTLxp0XxPY5VGsJUqWkU7nqL5DEA4/bqAUTwzBelNMMqYm5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/O4EF1X7IwN+wEDSXSOMuY3xHn0dNJGCmEjFPphIAg=;
 b=MvOfRNNlbqcsCcNwtKyeaPZIXXGFNNZ/iCKvCxgmxusp1w9Raz855ppTa8GkrvQzc2NzA+bu3lJLfgx8ts17q8R+N01UZyDBNGZdT8incDg70BubPbN9xT2kHbhwkqv5NCfz73Y3Rdhu0bJyiEzYIeobBUodNVYQ/+VqI/sIC4blfJqHwpp2L5LpOrDzMytOcv2kAfK4nhNg3tXCSZqgTdKJZuFm/SGtZzl9ZkXI2LXDAwQ77aOKXsr5Sqf34hhZDnh3Azp64w9c09iiG8WLGD9EbdzgQ3oSfNjBHXzhyv0gdcoYa6KwlLIbbX3H3rF8OE1Q/hGroGRMFmF2W57V3g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Thread-Topic: [PATCH v8 2/8] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHbe6bXkeUuupR7FUWii7Y2X2QPj7NAXFWAgBkWagCAAA3dgIADMMmA
Date: Fri, 28 Feb 2025 11:31:48 +0000
Message-ID: <8a559344-e239-4b99-bfaf-325d0d8aded3@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <67b9bd138c12c0df35e5c4b3137c30ad345097d5.1739182214.git.mykyta_poturai@epam.com>
 <67c8ce1e-5559-4567-9eed-970d97c29bda@suse.com>
 <e6ea52a3-c7ce-411f-8186-cf725aa608f3@epam.com>
 <82b8b042-564c-4013-863e-499c316be344@suse.com>
In-Reply-To: <82b8b042-564c-4013-863e-499c316be344@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI1PR03MB6480:EE_
x-ms-office365-filtering-correlation-id: 25231ab5-9a2f-42be-c512-08dd57eb7d5b
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NzVrR3oxeEl6MW4vU3hVREpDQjFKVXlSSE9KWThkbFY0V1hZT3ZBTlNVaWsr?=
 =?utf-8?B?cnVITXUxTmE2bTBQVFFuVlJnSC9mMFl2RjlvcmFwU0NpN2h4Z1RYUkNINmMr?=
 =?utf-8?B?c3plMmxuZ0xXS0kyRU1OK0JDalRZTkdaMTlWUEtYNmN3T253UXNwa3JWU3Va?=
 =?utf-8?B?K2k4TGlvVFlYVXlrc2VpenBqUjhPeExZN1d4dVZNdENSVm14TGtjQUxBK1J5?=
 =?utf-8?B?SlBHWlBUR0p3dGxPNjdBRGMrSndWSTg4eWlEQXJLOS9mTkZOWXJjTWExOHVN?=
 =?utf-8?B?WUJVbzZpVVdWL2xSWWt5UVdBNExnQUk5YUl5aDhOMTBuMzd2UTN0Vlp4WFBM?=
 =?utf-8?B?UldpekZiMy81N0hTV2hIWkJoMWJJbzhLeldyWGYrNHN6U05Yc251RDI0ZEU4?=
 =?utf-8?B?b1BNTXFuWVp2QTNwamxrSU9MQjd2aWlHZGk5U1EzZ2dyS0lxRXJ2dlZsZkRx?=
 =?utf-8?B?V01hU05SeGVDam1HeVJuNTVhSHR4Q2FBeDFwTUFtcVFodmswcmNBaDNyUDNZ?=
 =?utf-8?B?Wk92WnhEV3pPSG1KazdVdmlIYnRjbG52LytvcW94Tk9XVytJQ2x4THhINXVi?=
 =?utf-8?B?SDBEay9tR1M0dHFUcllYQVcvcWdBbVRqdm1LMmhIVU9mb2w1U0VTMVBhdStF?=
 =?utf-8?B?RDBONlZaY2thUEsrRXNjTHRnaUkvUmNDRzRmall6UU5tMnA5MXdlMmUvS0NQ?=
 =?utf-8?B?N0gxa1EvQ0NrTHk1ZDYwa1pkUEV4VkFySjVHekZOQ3lIUDZzeHFDLy9QclNC?=
 =?utf-8?B?UnBwdnhLS3VoUkVxblNrcWJ2S2pWSUFDUk4rZVc0d3hiWlpyY2NlQ0tWdXRW?=
 =?utf-8?B?YmlscXkrTlVFd2xFMzVRaFl2ekNpa3lqNU1SWG9jSElMU3JSREtIeHQ2MFZs?=
 =?utf-8?B?KzF4V1h0QWZwaDI1cFhzdkI2bUlZYWJJOW5aYkR6WGtFbTBqZlBNSmxQN2U4?=
 =?utf-8?B?NUEvSzZFUnE0dExiaVRlS0RnV25XVm5ZVTN5SHJzYUVYb2krMmozcFJ1N1Nt?=
 =?utf-8?B?VG1kTkNBdFFRYUlLdjNRR2tza2puRE1WMnB0TWRER2EzNXJ3c0NHellOa25x?=
 =?utf-8?B?em9IOFBtVkwreHNGT0JsOVFPUlBaeFFYQ2tVVmtpK3JYRmhCRHpNVGR1MmVX?=
 =?utf-8?B?TFVYS09wWUVmY3VaRDZnTURKeWl4ZWI2RlptS2J1TFY0cmV4TEJ2aEJnekRC?=
 =?utf-8?B?RW41NHpkMnoyME84L2dZV1RoVllFTnJua3BSaWVIZlBRM0dUM2dDY0g1TE0w?=
 =?utf-8?B?bzlYM0hCemxueDgzUGkxZ3BxZ0c5c0IzYUxlVVlUNU1MMzZYQm1rckM3UG9Z?=
 =?utf-8?B?UW16VzFMYWZEOFVqTXdCdmZSSDJ3MlEzV2FrMUhFdGl1ek5MRHNnaTA1enpH?=
 =?utf-8?B?UTBvZE5ZckZRSUpIb3BPUVBtV0syb1QyVEtlTjFvQS82d1pJUkwyMHlpSjdv?=
 =?utf-8?B?LzcwbVdLSTEwZTExVm5JMUhpU2NSeUJLNm96YlU1N2hXeVNJWWFNemNIcmxv?=
 =?utf-8?B?c09pUlR2T2Q3NGQwaGdTMHhKOFNxRXh4Unlxakx0TFd2cHI3dk1BMDhtbW81?=
 =?utf-8?B?cmgxOTVmblVWWkluUXFTWHBEcW1vdml0d3RtRWtDNlRGUDhIb0JBb0w1blpR?=
 =?utf-8?B?SzVsYUhicHcrMEV6SHZnb05TUlRYbk0vUmsxdjFBMklEbXJJckpSdGpvYXlj?=
 =?utf-8?B?LzlHQUtxcFBENTRkWVFWVXNLRHNVVG5IdTBQanB5cDYwVkVZcktVQXkxOXh3?=
 =?utf-8?B?VFkyNU9CV05ORCtsTEJ0bjhndGN2OFpTaHhhbjVxU3NoT3VLWFMwalZkVTdT?=
 =?utf-8?B?UnVZYmFMMHY5T3BsbytCY2p5b2k5ZWZVbk41eWVQYU5aN3N4bzVGenlWMktL?=
 =?utf-8?B?bXlUSTVnVy9QRkhWanV1NHFrVXNPNEliV0NrS3JFbVlwYlBCZGlhRzZlSjdX?=
 =?utf-8?Q?BpuD1dD+6hVysVrGk1Z9L+gwX81f0G3z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEhOdHRFUXExcXVvbFNtQlBKMjUvODR0cWpvUlJSUWt6TEJaU1l3Y3JGQU9Y?=
 =?utf-8?B?OTlHcjJTYzI2SUVBdm1WL21uNGlyaVNCbHl1TlEzaXlqY255UWNxU1Mra21H?=
 =?utf-8?B?OWxoaUMrUlpCQlJxRXl6blAyc0FTR296ZzBuWUY0YUREK0g3VThxVHNzZUdx?=
 =?utf-8?B?VHNjZ0IvQ2hIT2NzT1A4Y0R3UWFmMHlGS1ltWTdPMHFjQWwvYitVandxRndP?=
 =?utf-8?B?ZnIzQ1htSnVNM0FZVElxdDA5STc1c2ROdHkyZFM0UmlNZXJTYklvd0N1TnVL?=
 =?utf-8?B?ZldrUEJCS3NnUi95WFVPYjQ5UW1LZXFEQWtzVlN3T1hidTBuRjVKVHVueVpq?=
 =?utf-8?B?Um5xQTJzMmIyS1ExaGdtdGUzTjYvcXQ5dzlrL2JEeXNzblhjaFEwYndhMmJ5?=
 =?utf-8?B?ZjFHalUyNTRsdDBYTnlqbmR5aWNQQW5XY1FEZW9BNjlKQ2ozdGJnakVNSnRD?=
 =?utf-8?B?ZTU1dVk5UXZ1L25MUmJiVzVRWWxlSmpYSUdSNTlvYVh6clJxV0ZRb2g4dnZS?=
 =?utf-8?B?UFhubkpMeU43TGMybjd6VVdWMEU0bmtWaXRiYkpyS1p2bUs0R0pvYk92Q3VL?=
 =?utf-8?B?NXNRcUxuaDhzWFUyVWM4OVN3bDN1Wll3N1RaZ3NKM2F1b0U4NkFRT0hneFla?=
 =?utf-8?B?aUUxKzNpTldYZW95eHNkZEpOaUFaTzVYRWJOSkg4NVNNWnRseHk2SDZpVmJ0?=
 =?utf-8?B?TzBwVzdWeVFFM1dVOUhTU0k5OWkzREl1bGN0ZnlsV0MxTGtDYWRPRlV2eU84?=
 =?utf-8?B?N1dBVjVFSXRtRW5WYlpoOFdzalBnMXh0amhDSk1CQ0Y4RXoxMG1LWDNwZmli?=
 =?utf-8?B?RzVTUGlHeXppS2NkdkN2Uk5hZkppTnB4K1pBLzRZODk2Nmo5T0h6SHozalJy?=
 =?utf-8?B?cC9XV0liRWVwdUU0bWl6dHhxaGhTOG9tcEJCbW93QUlvMDBObUp2N0RSbDc5?=
 =?utf-8?B?UVNkZlJuZVJsQkhNZE1kS0pYUXFUY01yNExNUkh5WWhmU2txZFY4dFE2OGU3?=
 =?utf-8?B?Wk5UY0RCL1V1dlI3TFFWbjdkRlpwZXl2eXE1Z0c4MEdGWWhCdzVUREVtREF2?=
 =?utf-8?B?VU92eU9hL2RQSTVUdlBkbTBOY2hlTzhNYnZVbGE1cEFGZm5VVFlRS0YxcTFL?=
 =?utf-8?B?dWduRGlJVzRsRmRONzFoYU5xRGNQTTBSZkg0OGttT2hIQWNjZVEvaVlRcHg0?=
 =?utf-8?B?ZmdicFZhQ0VvYVg3cjlsYU5qTXlqdFRSQUhPelZaaU8zMkR6VjFDSTQwS2RT?=
 =?utf-8?B?YkFsVStFb3Avd2o0NmlKTVJ4QlZ4KzFuUElNVWFPTkVSN1ZKMmJLRjN0Nm1V?=
 =?utf-8?B?ZHF1TTVGVWpNL0JxUUtYTkRoVUVYenNWUm82MzhYWUJmRVViRHltUGk0Nm52?=
 =?utf-8?B?YnJiNVhwWnZYYkVzMEJKdDBCYytuYlFQR1lTdm85a2pyZmpLUEUrNGxrRnZE?=
 =?utf-8?B?bkdUK0NrRmFmeG4vVlpmdWVzZll2ek1KRmxYbGlHa0N3dVNROWNJWUVrMHNp?=
 =?utf-8?B?MkFoTXl0bGlySUpGUjF1VFdzK2pldWc2VHZ6R1FrZzhxQ1d2TUFRdmtvQnp5?=
 =?utf-8?B?QVZ2U0FsdlZybk1mK3JvSTVrVnRSRHRFWkJ0anV1NGZKZFhoQWJibmNkT0hn?=
 =?utf-8?B?S1h0VnN1Tnc5OFZ2ZXVnWWIzZURDUjlSVWlRMko1M2hVMWdtZVgzVnlxS3BF?=
 =?utf-8?B?SXRpeU1KVlRjQlVBakpYWW9PVHk2VUVHaXlBSXVKaWM1SjBqc0tMSWZlN1dJ?=
 =?utf-8?B?V0tLWldUWHVZWk5kYzRNUHpsVTY2V3pjcEFWYzNVaERpZnd6VngxMGFteUMw?=
 =?utf-8?B?ZEU0dm9LVmV2aFZydWZ6cGo2YVR3b2JXZkJwUHVzRmZIbWdPVW5hWVBhSGFw?=
 =?utf-8?B?eFBJdmdmU29pbFg0RzcxOTZWa3BKVEV2aVVJb281V2JhWnZXYU1MNWpCdzQ1?=
 =?utf-8?B?aGNaYm94WFFTUEk5TUgwVHhQVytGcytSak9UV3RUWFNzQmZvZnBWcUVRME52?=
 =?utf-8?B?QWZtUG9ualg3UUd3c0xleDBFL21tOXhoWXppVzZMZ1Z6VFdHMkZDbFdkc2Y0?=
 =?utf-8?B?T215ZWdqc3ZzUE1CRmJPU1FaakNPdmI3cVgrbUFIWGZPZ0xyd042YkZYaGhX?=
 =?utf-8?B?NC9xVkcxVkFpQ3haNWRHeERVc2hJcC9VeUhRU2JFbnhuZjhLNGNmMHBTUms1?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC2D137DECBD0440BC8825E25FDD663A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25231ab5-9a2f-42be-c512-08dd57eb7d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 11:31:48.8278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClJGEgjbsvFsmedqaT+EKebq0Dh2slBea34vwinGBshmV2RVoJPI0XIBWQXy1n/iitjil/elYVk4Y/ZAFVVfpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6480

DQoNCk9uIDI2LjAyLjI1IDEyOjQ4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjYuMDIuMjAy
NSAxMDo1OCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+PiBPbiAxMC4wMi4yNSAxMjo1MiwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTAuMDIuMjAyNSAxMTozMCwgTXlreXRhIFBvdHVyYWkg
d3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4+Pj4g
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPj4+PiBAQCAtMjAsNiArMjAs
NyBAQA0KPj4+PiAgICAjaW5jbHVkZSA8eGVuL3BhcmFtLmg+DQo+Pj4+ICAgICNpbmNsdWRlIDx4
ZW4vc29mdGlycS5oPg0KPj4+PiAgICAjaW5jbHVkZSA8eGVuL2tleWhhbmRsZXIuaD4NCj4+Pj4g
KyNpbmNsdWRlIDx4ZW4vYWNwaS5oPg0KPj4+PiAgICAjaW5jbHVkZSA8eHNtL3hzbS5oPg0KPj4+
PiAgICANCj4+Pj4gICAgI2lmZGVmIENPTkZJR19YODYNCj4+Pj4gQEAgLTc0NCw2ICs3NDUsMTgg
QEAgaW50IF9faW5pdCBpb21tdV9nZXRfZXh0cmFfcmVzZXJ2ZWRfZGV2aWNlX21lbW9yeShpb21t
dV9ncmRtX3QgKmZ1bmMsDQo+Pj4+ICAgICAgICByZXR1cm4gMDsNCj4+Pj4gICAgfQ0KPj4+PiAg
ICANCj4+Pj4gK2ludCBpb21tdV9hZGRfcGNpX3NpZGViYW5kX2lkcyhzdHJ1Y3QgcGNpX2RldiAq
cGRldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICBpbnQgcmV0ID0gLUVPUE5PVFNVUFA7DQo+Pj4+ICsN
Cj4+Pj4gKyNpZmRlZiBDT05GSUdfSEFTX1BDSQ0KPj4+PiArICAgIGlmICggYWNwaV9kaXNhYmxl
ZCApDQo+Pj4+ICsgICAgICAgIHJldCA9IGlvbW11X2FkZF9kdF9wY2lfc2lkZWJhbmRfaWRzKHBk
ZXYpOw0KPj4+PiArI2VuZGlmDQo+Pj4+ICsNCj4+Pj4gKyAgICByZXR1cm4gcmV0Ow0KPj4+PiAr
fQ0KPj4+DQo+Pj4gVGhpcyBmdW5jdGlvbiBoYXMgbm8gY2FsbGVyLCB3aGljaCB2aW9sYXRlcyBh
IE1pc3JhIHJ1bGUgaWlyYy4gQ29uc2lkZXJpbmcNCj4+PiBhbGwgaW5mb3JtYXRpb24gZ2l2ZW4g
aGVyZSBpdCdzIGFsc28gdW5jbGVhciB3aHkgaXQgd291bGQgZ2FpbiBhIGNhbGxlciBvbg0KPj4+
IHg4NiAoYXQgbGVhc3QgYXMgbG9uZyBhcyBEVCBpc24ndCB1c2VkIHRoZXJlKS4NCj4+DQo+PiBX
b3VsZCBpdCBiZSBvayB0byB3cmFwIGl0IHdpdGggQ09ORklHX0FSTT8gSSBhbSBub3QgcXVpdGUg
c3VyZSBob3cNCj4+IHJlbGV2YW50IHRoaXMgbWFwcGluZyBmdW5jdGlvbmFsaXR5IGlzIHRvIFg4
NiBpb21tdXMsIGFsdGhvdWdoIExpbnV4IGhhcw0KPj4gc2ltaWxhciBpbXBsZW1lbnRhdGlvbnMg
Zm9yIEFDUEkuDQo+IA0KPiBCZXNpZGVzIGl0IGJlaW5nIHVuY2xlYXIgdG8gbWUgd2hldGhlciB0
aGUgZnVuY3Rpb24gaXMgcmVhbGx5IEFybS1zcGVjaWZpYw0KPiAod2hhdCBhYm91dCBSSVNDLVYg
b3IgUFBDKSwgSSBhbHNvIGRvbid0IHNlZSBob3cgdGhhdCB3b3VsZCBhZGRyZXNzIHRoZQ0KPiBN
aXNyYSBjb25jZXJuLiAoSWYgdGhlIGZ1bmN0aW9uIHdhcyB0cnVseSBBcm0tc3BlY2lmaWMsIGl0
IHdvdWxkIGJldHRlcg0KPiBtb3ZlIGludG8gYW4gQXJtLXNwZWNpZmljIHNvdXJjZSBmaWxlLikN
Cj4gDQo+PiBBbHRlcm5hdGl2ZWx5LCB3ZSBjYW4gcmVtb3ZlIHRoaXMgYWJzdHJhY3Rpb24gZm9y
IG5vdywgdG8gY2FsbA0KPj4gaW9tbXVfYWRkX2R0X3BjaV9zaWRlYmFuZF9pZHMgZnJvbSBBcm0g
ZGlyZWN0bHkgYW5kIG9ubHkgaW50cm9kdWNlIGl0DQo+PiBiYWNrIHdoZW4gYXQgbGVhc3Qgc29t
ZSBBQ1BJIGltcGxlbWVudGF0aW9uIGlzIGRvbmUuDQo+IA0KPiBJJ2QgbGVhdmUgdGhhdCB0byBB
cm0gZm9sa3MgdG8ganVkZ2UuDQo+IA0KPj4gQWxzbywganVzdCB3YW50IHRvIG1lbnRpb24gdGhl
IGlzc3VlIHRoYXQgZm9yY2VkIG1lIHRvIG1vdmUgdGhpcyBmcm9tDQo+PiB0aGUgaGVhZGVyIGlu
IHRoZSBmaXJzdCBwbGFjZSBpbiBjYXNlIGl0IGlzIG5vdCBrbm93bi4gVGhlcmUgaXMgYQ0KPj4g
Y29uZmxpY3QgaW4gZml4ZWQgd2lkdGggaW50ZWdlcnMgZGVmaW5pdGlvbnMgYmV0d2VlbiBhY3R5
cGVzLmggYW5kDQo+PiBlZmliaW5kLmggYW5kIGl0IHdhcyByZXZlYWxlZCB3aGVuIGluY2x1ZGlu
ZyBhY3BpLmggaW50byBpb21tdS5oLg0KPj4gSSBpbml0aWFsbHkgdHJpZWQgdG8gZml4IHRoZSBz
b3VyY2Ugb2YgdGhpcyBjb25mbGljdCwgYnV0IEkgZG9uJ3Qga25vdw0KPj4gZW5vdWdoIGFib3V0
IEFDUEkgYW5kIEVGSSBxdWlya3MgdG8gY29uZmlkZW50bHkgZG8gaXQuDQo+Pg0KPj4gSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9hY3BpL2FjcGkuaDo1NywNCj4+ICAgICAgICAgICAg
ICAgICAgICBmcm9tIC4vaW5jbHVkZS94ZW4vYWNwaS5oOjU3LA0KPj4gICAgICAgICAgICAgICAg
ICAgIGZyb20gLi9pbmNsdWRlL3hlbi9pb21tdS5oOjI4LA0KPj4gICAgICAgICAgICAgICAgICAg
IGZyb20gLi9pbmNsdWRlL3hlbi9zY2hlZC5oOjEyLA0KPj4gICAgICAgICAgICAgICAgICAgIGZy
b20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYWdpbmcuaDoxNywNCj4+ICAgICAgICAgICAgICAg
ICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vZ3Vlc3RfYWNjZXNzLmg6MTEsDQo+PiAg
ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUveGVuL2d1ZXN0X2FjY2Vzcy5oOjEwLA0K
Pj4gICAgICAgICAgICAgICAgICAgIGZyb20gYXJjaC94ODYvZWZpL3J1bnRpbWUuYzo1Og0KPj4g
Li9pbmNsdWRlL2FjcGkvYWN0eXBlcy5oOjEzMDozNTogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVz
IGZvciDigJhVSU5UNjTigJk7DQo+PiBoYXZlIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTigJkN
Cj4+ICAgICAxMzAgfCB0eXBlZGVmIENPTVBJTEVSX0RFUEVOREVOVF9VSU5UNjQgVUlOVDY0Ow0K
Pj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4NCj4+
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2VmaWJpbmQuaDoy
LA0KPj4gICAgICAgICAgICAgICAgICAgIGZyb20gLi9jb21tb24vZWZpL2VmaS5oOjEsDQo+PiAg
ICAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL3g4Ni9lZmkvcnVudGltZS5jOjE6DQo+PiAuL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3g4Nl82NC9lZmliaW5kLmg6ODk6MjA6IG5vdGU6IHByZXZpb3Vz
DQo+PiBkZWNsYXJhdGlvbiBvZiDigJhVSU5UNjTigJkgd2l0aCB0eXBlIOKAmFVJTlQ2NOKAmSB7
YWthIOKAmGxvbmcgdW5zaWduZWQgaW504oCZfQ0KPj4gICAgICA4OSB8IHR5cGVkZWYgdWludDY0
X3QgICBVSU5UNjQ7DQo+IA0KPiBZZWFoLCBzYWRseSBBQ1BJIGFuZCBFRkkgaGVhZGVycyAoYm90
aCBpbXBvcnRlZCBmcm9tIGRpZmZlcmVudCBvcmlnaW5zKQ0KPiBhcmVuJ3Qgb3Zlcmx5IGNvbXBh
dGlibGUgd2l0aCBvbmUgYW5vdGhlci4NCj4gDQo+IEphbg0KDQpIaSBldmVyeW9uZQ0KSSBzZWFy
Y2hlZCBmb3IgYW4gYXBwcm9wcmlhdGUgcGxhY2UgdG8gcHV0IHRoaXMgZnVuY3Rpb24gYnV0IEkg
YW0gYSANCmxpdHRsZSBzdHVjayBoZXJlOg0KLSBDYW4ndCBiZSBwdXQgaW4gdGhlIGhlYWRlciBh
cyBzdGF0aWMgaW5saW5lIGJlY2F1c2Ugb2YgaGVhZGVyIGNvbmZsaWN0Lg0KLSBQdXR0aW5nIGl0
IGluIEFybSBvbmx5IGZpbGVzIG9yIGRlZmluZXMgZmVlbHMgd3JvbmcgYmVjYXVzZSBpdCBpcyBu
b3QgDQppbiBmYWN0IEFybS1zcGVjaWZpYy4NCi0gSW4gaW9tbXUuYyBpdCBjYW4gYmVjb21lIGRl
YWQgY29kZSBvbiBzb21lIGFyY2hpdGVjdHVyZXMuDQotIFJlbW92aW5nIGl0IGFuZCBjYWxsaW5n
IGlvbW11X2FkZF9kdF9wY2lfc2lkZWJhbmRfaWRzIGdvZXMgYWdhaW5zdCB0aGUgDQplZmZvcnQg
dG8gbWFrZSBEVCBhbmQgQUNQSSBhYmxlIHRvIGNvLWV4aXN0Lg0KDQpDb3VsZCB5b3UgcGxlYXNl
IHN1Z2dlc3QgYSBnb29kIHdheSBmb3J3YXJkIGZyb20gaGVyZT8gSSBzZWUgdHdvIA0KcG9zc2li
bGUgb25lczoNCg0KMS4gRml4IHRoZSBoZWFkZXIgY29uZmxpY3QgYW5kIHJldHVybiBpdCB0byB0
aGUgaGVhZGVyIGFzIHN0YXRpYyBpbmxpbmUgDQotIGJlc3Qgc29sdXRpb24gaW4gbXkgb3Bpbmlv
bg0KMi4gTW92ZSB0byBhcm0gZmlsZXMgaXQgZ2FpbnMgY2FsbGVycyBvbiBvdGhlciBhcmNoaXRl
Y3R1cmVzLg0KDQpJZiB3ZSBhcmUgZ29pbmcgZm9yIHRoZSBmaXJzdCBhcHByb2FjaCBtYXliZSB5
b3UgY2FuIHByb3ZpZGUgc29tZSANCnBvaW50ZXJzIG9uIGhvdyB0byBiZXR0ZXIgZGVhbCB3aXRo
IHRoaXMgaGVhZGVyIGNvbmZsaWN0PyBBZGRpbmcgaWZkZWYgDQpndWFyZHMgdG8gdGhlIGRlZmlu
aXRpb25zPyBSZW5hbWluZyB0aGUgdHlwZXMgaW4gb25lIG9mIHRoZW0gdG8gDQpzb21ldGhpbmcg
bGlrZSBFRklfVUlOVDY0IG9yIEFDUElfVUlOVDY0PyBXb3VsZCBhIHN1Y2Nlc3NmdWwgYm9vdCBv
biB0aGUgDQpBQ1BJL0VGSSBzeXN0ZW0gYmUgZW5vdWdoIHRvIGNvbmZpcm0gdGhhdCBJIGRpZG4n
dCBicmVhayBhbnl0aGluZyBvciANCndpbGwgaXQgcmVxdWlyZSBzb21lIG1vcmUgc3BlY2lmaWMg
dGVzdHM/DQoNCi0tIA0KTXlreXRh

