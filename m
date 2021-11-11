Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF14544D41E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 10:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224660.388079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml6Rf-0007gR-KK; Thu, 11 Nov 2021 09:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224660.388079; Thu, 11 Nov 2021 09:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml6Rf-0007df-G7; Thu, 11 Nov 2021 09:32:35 +0000
Received: by outflank-mailman (input) for mailman id 224660;
 Thu, 11 Nov 2021 09:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3rQ9=P6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ml6Re-0007dZ-H9
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 09:32:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c774d9c-42d2-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 10:32:33 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-laZvOOIoNxyU0ojm0cZiTA-1; Thu, 11 Nov 2021 10:32:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Thu, 11 Nov
 2021 09:32:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 09:32:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0064.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.18 via Frontend Transport; Thu, 11 Nov 2021 09:32:29 +0000
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
X-Inumbo-ID: 4c774d9c-42d2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636623153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01Z8zGm+qHHa5r+hXBaZDJMeG9QdN55X2uCoJFGD3Pk=;
	b=nCJ4ESWnqdlBL3MfRHrRm15Ia9aFIZXnYf/1Xgyt6m44LV5aMB6z6xwQVBSXPHVQS4qnu6
	5qY+YvtmjkHFDfnddjcNlc+5/OR8RYFS3uGD1CuR2GEJ/bJEkFMJBNfaLuqqJOcxNRKGm6
	6oWVDYfZGpPy7VMfeQmSmlUtYSXKudQ=
X-MC-Unique: laZvOOIoNxyU0ojm0cZiTA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8yoIsrVUNwioy4yTWcy29sEiod1BIGEyaVJF8lgJTGofBL5OAihpKoDIAMugW+nlUqb/zNxpMROhNHvGUK+IGbVVq1skCl3tVLqtLU5ProLKxEbU4R1oV7NFyjTurW9lWzpieGQ6RWadbMv/EbKTWs2tJgbCylE9gfjA2Amz1k0gVpDA2o+VWWEewwPiHYQX/JbmPwgIzg2SzTpjS4CB0TSei8Y/6AVeLsfiNpmr3/qpmeNtVO30KItiYkSlKkyzTqv08/2GfK9Cz5cDlP8PK1YAyOxViV8lm6PGdtqxx38LcLgBRNeKdhVCcbYJ1qEs/CnlI8n9/wYGoN2oQ6Qww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01Z8zGm+qHHa5r+hXBaZDJMeG9QdN55X2uCoJFGD3Pk=;
 b=ktduXr8yWMNN1vgvlZ/oC8GSb8Iztpk0FFodz39oEEwcdZCiE+mNAzmMBWCNr1gww+7W0GEEClnuRRAAQqOguEpcDlprWBomXDDyufB3f6x7J9nCEtEUWKtOXPdUaPz9x2sbGQQNlfSi7je2yRRVu+nPdw7Tk7T95xrKqzGh6wI9yHrJNbZHtHgnOx6+fKRM+MTMzW2RM0s8ZQ9qBjE6IPUXN9jtHil38VQAefD4DT2Mm2kG1AE0KF/PBXLEUX0eguE7PmlbIW762lySiCqgohMafSJddhDR8niBUOeMKf6Jlf278O+DijcXy/ngv8ZLLf9x9f5FxnAXdB8s0qRkgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e46d003-57c7-f11c-4366-adbe6ab52ffa@suse.com>
Date: Thu, 11 Nov 2021 10:32:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3][4.16?] VT-d: misc (regression) fixes
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
In-Reply-To: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0064.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78a897d2-af50-4ef2-63b8-08d9a4f62eba
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7151681266205084C4135ADAB3949@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d99cxJd7h54uH/Oda0x0LiD919MwUSBtBViDrqmRaJfF4OIg8ZtEiMT5yAlzvLZ6D/iykYcWQ4Rs7U3pq1Bj5gGqENaH5iMfX81ht4HrtbfVFUA5tmljJSld4c0gEACKS1KIbhrzidC7yDAYvd6ZVVUch3dEI2arULShtFBjoqUw/5m00uxeQKuH1lBqX9cE97xvpEY+qEiAkz1nae/CQqe3r8wfgoNhXZabTM4UQXDBpmhbzIhbHogTk/rj+YNuBehqrGgydk4N/pSJCRIlxio6DEj3XkgCBwd16HLJvvxmzKmd5qjC1rpOM9cpXFbrigCTQHIfd2NrvSEeGDwlo4hPA34/DKkzpnmwUHusPMI/IY2JzztwLv5i05mdDNUPi/mFQPlcKhf3jgubaZiSlQycTlyCuN3lOq+x1dVRkV6bVMUcBWUUqpfbr8r4CJQrTWpI8veiYnK/U2QYkNRFRYMHP5p+jby3rhKZ29kugLs00zGPUkanEEgAjtjmnJVvQ4v7G2T+1qv6urBXUBV0I34/nrB4doCPoaTz9v+P8a0D6ZfIOrUwNmB9nEDcCUgRhP8ocyjMSU4RoMB8r2Rok0N/FSG9vdlDsYVo8Qj3hQ/OVHurvQW4Y7fzObYsfG5XlkVqaeWECofJP+0QduLxN2SGNkvA+hZDZWB6hmkLbpBUhTXQVpZhQYvBbdU8iwvjnPB6svMkvOrpBdiVEOhMOcsclUM4hHNS6w0C4DsGmWscTrSY11AgpIeAEdxYcsD4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(508600001)(54906003)(26005)(2616005)(8936002)(4744005)(66556008)(66476007)(66946007)(956004)(316002)(53546011)(38100700002)(36756003)(5660300002)(186003)(16576012)(2906002)(31696002)(6486002)(4326008)(31686004)(86362001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjF4emhyaFBXd21zREIrYWY2M3FCNTdSZi8yWFcrN3dGb1JWWU5DZDlTM3J4?=
 =?utf-8?B?R2F1aGM1cE1TdGxKTkY5dUJ3TEI2UDVXMzlvaUdvYTJTTUFQb0hReGRlRWlr?=
 =?utf-8?B?a1NPY1N6aFdVT2ttKzJ5MENRUk9VdVgrYjJzNGIzVGhyRGkxdXVaalRVUEo5?=
 =?utf-8?B?RHJWYjVXVlYzdkNxT3ZOKzlPUmNQWGFSOFRrcitrOEZ1QXFpT0FtMjVubTJL?=
 =?utf-8?B?dTlNTXBldEVnNFJmeU5UQzFvM29wcWE5Q1ZDbWlHWEQ5Q3JlNHkwTyttNWlL?=
 =?utf-8?B?bDBXNDRGSnVRWWl2Q2tTK0s2K2IyTFUyTGFnb0FXeitJYVN4VVVGRVNKQ21h?=
 =?utf-8?B?aVQwK01SdEdiZk1BR1lEMkh3aW5jMWdjQ3A0dXFvUXFONzdNR1gvazByZk1G?=
 =?utf-8?B?QmtOYndyNkpNRjduamJDbjVXaWgyVlVabzVNMXhTZ0l4bG10SHRMQTEyZDVH?=
 =?utf-8?B?V3pPamZHZFBnK3cwZHdUOEhmR3NhaDRhUnk4Q0VhSlBQT21zMHU0R2loU3hJ?=
 =?utf-8?B?SFJNZE9aOTRZN3Y3YVlEYUJVTnM3YUxrUGRQUVBmRlAranN1WGEvSmRXR2JX?=
 =?utf-8?B?all1MzIxTVNpN2hLZzczZ2djUVVZMUZMVUZHbjRhaE04WDg0Q0FJTUpiY0l2?=
 =?utf-8?B?U0tlWGMrOVdTdUhBRFlGbGtoOGVBTWNUNDNFN0w2eG5XakRxMnlXelBldC84?=
 =?utf-8?B?OC9RdnlSQk51OEFZQ2RhREdYejd4cHZBNDZaYUpqRVFjUS9iNUJ5RTBQOXVN?=
 =?utf-8?B?clUxWG42WndCNDdVSkVHa0hheFpNa1lka3g0aGdsd21iZFJBMTNidWRiZWsz?=
 =?utf-8?B?NjZKYmxXTmhGU2doekN0QTNzTmhqa1JteG5EejNlVUFuRm1hUzRnbjRBN3FF?=
 =?utf-8?B?eGY0dUphdmlTcmRSWmpDaCswVFRvUGVkTmJwZjNEU1N6blFNK0czSHRHTGth?=
 =?utf-8?B?M3NlK2pxSWFXeTJaRXpCanU0UU9xR3l4UzVzVFBHdzJQSEh5NlNTb20zTk5w?=
 =?utf-8?B?aFlnRGRia0l3azY0NTJYOEFIUXVSY2l2OHlZRngzemFkWW5Yd3pqUFNrSU43?=
 =?utf-8?B?U2xqbDRMUVNneE5RTk1Ebkk0N3VoVjc4Y1h2TmlhL3RzL0pNcFpJaHZrc0d5?=
 =?utf-8?B?ZWQ1QS9WMFYxdU16VjB1TFArV0hSaVlVMmo2WHJ0UGd4TVE3Z0hmSCtLYXlD?=
 =?utf-8?B?ZVVzSE5VZ2xOc3Z5RlBEeTFsblgyOEUvNTk5UHhVbDFiT0R5cEJQUjBLRSti?=
 =?utf-8?B?ajVVNVJyMEw1YzlhYTFLSkhQcUFEcjJCTUhLekVCcGlKUWJzWm1zQWdLL2lm?=
 =?utf-8?B?Rm9WVVY0eEt6OVlFLzZZVEFKM2pZWlR1UnBkOTI5dS9HUjgwTC8rUCtJSFA0?=
 =?utf-8?B?TWpUaTU3bHNHRXBYanU3RkRUeDBpVURzNUxyNWdaL3ZYWGRHNEZUTjlOenJT?=
 =?utf-8?B?S1VPdExvenllU0lzbWZydTdPQmtQYTZtcUVyTGxNMWxZSHFqMStiemE2cXV5?=
 =?utf-8?B?aGY3SjU4WW05YUR5dU9WT3ZpKy9GUjZXZ0JqQ1ppbTUzWXdSUnhiVndBcEZ1?=
 =?utf-8?B?c3E1U1dzakFIbC9qZXhUYUJZaXlxeGY0RVJpSzcydTJRM3hhZHNRclkxbnk0?=
 =?utf-8?B?V21zN0ZuL3BuWnRPYVlpeHQ4bjAwVGQybjErSU8vaWwzQk1rS012K3F4dzZQ?=
 =?utf-8?B?eHhFZ3ZDM24zNFUrZ1FOcktkUmJ5Znp0em9VZnNyUkQyRTlxVDJiVlBvaWUw?=
 =?utf-8?B?WVhoRlpyb1B2dFY2K1huRGxkZzFHZk44WE90SVBFTWhOaVA3NXFGejdpVTVR?=
 =?utf-8?B?RlJIaUk0bHpHeGZKWXRxczJQUlp2NU1RUWw0c2dyLzVROVo5ckhPTEJNVkxS?=
 =?utf-8?B?Uzl6OU5CTnlFckdHaFY0Ly9NRHp2dVdZeEhxdWU2NCtFT0JFejZGSW1sOTJo?=
 =?utf-8?B?N0d4eWlNbHJTdkNPeC9LOTdzQmNxVlM1M3FyNnJZQ2pZS3VET1FpdXFZSmxy?=
 =?utf-8?B?U1F2SU9vVFBGSmpaU1QxT3pLSnI4SnQ5TlBRd1JOcExyYVZ3ZnhqaEdNaWNR?=
 =?utf-8?B?anBGMlBSejZCR2JxQ1A2cFlEZ1lkVExKZVRYS3Y1QTEzbjlyZHdkNUNjWkpM?=
 =?utf-8?B?SzZKaDFMam5aQVJPeG5zRWRoRm5PTHhyWUlQUjdOZXA2a1pFbFVjYUk0aE5S?=
 =?utf-8?Q?XbezAbOEN0EtRVW+PftdPls=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a897d2-af50-4ef2-63b8-08d9a4f62eba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 09:32:30.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQafuQW+Hf+ysNNjzpxYekjBI3AYtR/HfYKpC7nBQDF43pX1D8u1SnVbHZtoHXEJG3Uv4cVDxcfzA0gY2u2eKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 09.11.2021 15:55, Jan Beulich wrote:
> 1: per-domain IOMMU bitmap needs to have dynamic size
> 2: fix reduced page table levels support when sharing tables
> 3: don't needlessly engage the untrusted-MSI workaround
> 
> As to 4.16 considerations: Only patch 1 addresses a regression
> introduced after 4.15, the others are older.

To further explain this: Without the earlier change, systems with more
than 32 IOMMUs simply would fail to enable use of the IOMMUs altogether.
Now systems with more than 64 IOMMUs would observe memory corruption
(with unclear knock-on effects). Whether systems with this many IOMMUs
actually exist I can't tell; I know of ones with 40, which isn't all
that far away from 64.

Jan

> Patch 3 additionally
> only addresses an inefficiency; the code we have is correct from
> a functional pov.
> 
> Jan


