Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E9D442DD5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 13:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220189.381354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhssW-00043H-4Y; Tue, 02 Nov 2021 12:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220189.381354; Tue, 02 Nov 2021 12:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhssW-00040e-0g; Tue, 02 Nov 2021 12:27:00 +0000
Received: by outflank-mailman (input) for mailman id 220189;
 Tue, 02 Nov 2021 12:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhssU-00040Y-3u
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 12:26:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07f29086-7e22-4797-b390-40fc1f28ce3f;
 Tue, 02 Nov 2021 12:26:57 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-G9IVvm-QM1GvT6Uis-0xsA-1; Tue, 02 Nov 2021 13:26:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 12:26:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:26:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:20b:311::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 12:26:52 +0000
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
X-Inumbo-ID: 07f29086-7e22-4797-b390-40fc1f28ce3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635856016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsPt4LEVFwOi0Ya6VAsEssnSXim3fq8f6SBJOmXnPps=;
	b=ZZfs9kigmYfjuPFu8wyceuTifQ4nLcci49hJEd7smbZZ13I5qjgiandFqBfRXZmOCPe3/0
	dX0hOpv3rDezSgWbY28PUnIL5p5bUkt4u1iwDg5hn7PrgAb5HL/ZdUGWbneakhao3c7LPE
	Lq+NbMPkfiERE7hpWxx4Dna4KyJEeYQ=
X-MC-Unique: G9IVvm-QM1GvT6Uis-0xsA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciMj6PefBdHpUfsxYFiQukhnm6riMNDBFUvzt240VQH0Y1kQs0FviaII4d+SjY+4mOkokcq8xM9NnganZiU2dbu3qW7XDZ1kjRfA9H3lW8RJeE8JUpVpcR1dI629duDDW3ngxs/HwR6ygaBgS2vheia/iajETORplRBPCatUSV5Ul4QjCbTDtTcPvivJ6B03/dDwG5gxvlz9AhehP2y2AXbDYpPy0WM9U9KOj/aXBTzUicU1DEPjl6ZLdds4IQH26fmaEeTZmbvaLqAhXFmr4hrdomxR2MlUA1uAJIhYGpNOh/xBckBP7xYwVqAQmOZHRVIrLX1Pg1+fsD2OF7UWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsPt4LEVFwOi0Ya6VAsEssnSXim3fq8f6SBJOmXnPps=;
 b=gZfxdgeT+8MhVJ9t2RQh0yUroddT6F2lKPo0RdzchTQm8nro0ARgMCrxZPHNoE7fRSMdVQHWpa4mMh5gFrPnb0I1rsBXOPb0owVNdOhiJ2upInuvmve/N1QecfA9ayT/9gLdZO6YayAMMWaTnRL0wHxlhxk1qywOvU/rcywvYhmjGLsCtoVBcrte0ZDEzEBdhGIV7nV9hvOd46cP+z9WjhjhlbMqttFto5nvnnHSTPMJWj93PMH9mKGgeV06dp9l1kVH0T2UI8R/VMZfARIZatC80nwbJN4v1gFTBoDTkeSNpbeXnVwaehfdXinc0U9yKkgDeXCYBEWT3K0TY7TG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c802b3c5-cd21-50ee-2a42-6f1c81235fa0@suse.com>
Date: Tue, 2 Nov 2021 13:26:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] x86/hpet: setup HPET even when disabled due to stopping
 in deep C states
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <68352fc1-9ba0-1081-be50-065b212f96a3@citrix.com>
 <20211026151233.57246-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211026151233.57246-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0010.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73018544-91a1-4d86-117b-08d99dfc0d63
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37769C2E67B857EE5E4CA0F8B38B9@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QPPAwoK5Xg7LrMexHmFhvohBbrC3T9AGVZwbIz/IEtohW/n3CmvNY3syACInje4hptRDRwD9wRrvOqSitB5i6yAhWov38WJI8oqn+T862h1t9Ny0c8wfDlvgZ2TbTtv78f2Oc7hBFOdgy848UZ8OE9pz/IBNbIdsVn9w2W0XYBToCP/JRmO8/TY2iuQRwlEfrV5sjsL8Wwc7iyYjPaTbXD26WyKWOCA5EIMjmwLpUWZrCjGobC2QHE4zfNwbyoV0gZjDBzMCsFP5juBdM2MRbbV2r2KMov1qpiyMIx9fEknveNJEPErjHoVQe6pEMs+1de8NujuBlyNFfEDQum5L1o68wOf1xtB5D/1m3k5/akiGX8e0Ve83WlediPbs5+Rr4iLrMJA4MxGUMePT/kSE3byWbz3zPNiauR4kuZZKqcNzIBg7079WH6+LfupXrbM789CcEBe8/8RNzEXzv+NCInxqHNCL0DPKgHrTAewkh7HfSb6uZZd3QmsVKdwyM8UQucYwlLcfmu4yJVlimhPd3G9QikCz9XmWKOg2rcomO3duSTCBgcisot+LrD3NU5pDwr53YcDEF94do4DMGVvblZ7OzjC5Rba/xhwlbWAxEu2ipaLBSbNV5SIY2QfF2QlfAyIIwl3CLudB2LPepZRJ9P/W6/W3CPn7ps3wQxiTvxkfbK6v0Fcvdobu0/1NNFyeOd9evUTGs/u275bkyE1Z2S9Im378KKkQkh8a8sNnv2SE+VusBhfEv/SfXmu1Z6UN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(186003)(4326008)(53546011)(86362001)(26005)(6486002)(508600001)(2616005)(66946007)(5660300002)(956004)(54906003)(83380400001)(31696002)(66476007)(16576012)(316002)(8676002)(2906002)(38100700002)(31686004)(8936002)(66556008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZThsWVMzenFHYjN5ZXNKbHExVm1HY2FiSDZtRWQ2YnN0TXVzenE2Mzl4Rk1j?=
 =?utf-8?B?SWJGQkVVeDJ6cHdhTk1Pck0vRDRKUVhlZzJuS3NwbnM2Q28wUGxGMktKNmFP?=
 =?utf-8?B?SFU0bnFyN3BWdDNDcERtTXNGcWRjKzcrL1hsbk1WM2xPUndPMjBRZkVLbEtn?=
 =?utf-8?B?WFFWbzd0UHdYbUJHQ3lHc1g5SE9SOXFqRVB6enNwdTd3NVlXL0hRVXNnSUNt?=
 =?utf-8?B?SHBhVHBML0ZlMHpxWC9TSXNId3k4MXBwNjg4YTM5OE5vY2p2L0FLNlRTNDFv?=
 =?utf-8?B?c0ZsdjBFR21XNXpQUVNhL1Bod3NGVTlvaC9yVDFxdWljVDdoSFN0NitVTy9x?=
 =?utf-8?B?Mm9FS3VLUUwxdWJJRHF3U0FHamlqL1hCdHpRei81U1dTSzU3bXZsb2NRcmEv?=
 =?utf-8?B?ZmxEM2I5cjdVYW5tSWlsUmYyU1RPMjF1NWdYdlZOcjczV2l6ZXROK2VuMHFR?=
 =?utf-8?B?bS8vNjNma0tNVUtxdG5tcmM0YmRMTk5wVHpwcklmQ2FqczZtaWVQbFlsYVAw?=
 =?utf-8?B?SGJwU2FTblpCVy9HK28zeGRxNUhRekU0U1laNnU0MGVwWkJLTWE3bzArTXQw?=
 =?utf-8?B?bFJJeThJOFVKajV2MlNXck1VbG1HaHJ5WFlpT3ptZHVyMjZvaXcyWVpueHJz?=
 =?utf-8?B?K0dieFR5bG9rZEpmeCtkZ1hJbDFDSE05eGpnZm1oSjVzSnRvRnJUeGo0MjA4?=
 =?utf-8?B?SVJlTjdTYXdTRVN3cDV6bjE5cWYyaUtXdUNzTEFhTzFUcFdpekcyZkJyWFI0?=
 =?utf-8?B?enhPYWVlQno1Y1Z2Zm5ycGRHbThiREljZW9WK1JjSDZta3lobTV2UjNmQ1ht?=
 =?utf-8?B?eVpjbHFzSGVrcDMvTy91OUp5REdKSzhTWkx0QkJ0RHdaaklhNG5ZQlp2c0xr?=
 =?utf-8?B?L3ZmVDUvNytXc2wvU254VkhxUGcrR0RUVHc1N3hTUTBCSUFQN1h5a09yZHFM?=
 =?utf-8?B?Ky80b0gwVmR4UWVSekRwNjdFMnM1cUVkVUJnQUpERm9nNnN5ZG9lbmVDdFRh?=
 =?utf-8?B?RTllSVh1dW9FMDBJZE1seUpnMGQrQlpCbEZXZERCdXN1cmZkSm1keEZZRmxr?=
 =?utf-8?B?azEyV08yYk5GaGh3eEt6bUc1Yk1ydmp2MHA3WXR5UDE0VzZsekhTV2F0ODBL?=
 =?utf-8?B?NGwxQk52QUdUaCtoL290N2pNbHlkbUd2VFBVZWU0emg3UmtnWHdjeHRFOE5Y?=
 =?utf-8?B?ZHRRUHpadE9RbEF2YjUzSXNtaTNnQnVvU2dTWjNSRVFjTEZ3NS9UQmFRTjlq?=
 =?utf-8?B?RnZPeUVFVjhxamNoYkJ6ZEpETm5FUlk5cEpEZGIySGRYRmhPeUlHajZYRWZD?=
 =?utf-8?B?N1VwMW9qYm8vRnVSMGJCc2k5TXNPcHZnc0NFdjN1cFFERUZHd3RpdnRoM0RR?=
 =?utf-8?B?SCtyWktoQlNDWkZEK0RnTmtjWHZDSmx3dWZGSzZjL0I1T0xKY1M0bFBmaVZ0?=
 =?utf-8?B?RXQzZ29kV2ZIek5ucGJxQ0lpQXprNmVkalZ3dUc5c0ZxOTZ4UEIrWDZJblRC?=
 =?utf-8?B?T1lQNkNPQkp3N3BIWkdncTBNUlFWY0gxcnVnOWU5VkJ1Yys2Q3NRK1dZVk9R?=
 =?utf-8?B?K1FUclNUQVlhN1NlL01DUGJKOUp2SktIYnZtOWl1cWh2ajllbTR4dlVjcmQz?=
 =?utf-8?B?a0d5c1J3TTNwdWxxNUEzNVlVTXdxem5ySGFBbWZxZ0llWGM3bmU0b3FvTVNM?=
 =?utf-8?B?Q2xuRmRPVGZiaUREYjhneXIxbHFYdS9lbGFUL21mVnBHMGREemFTZ0luSXU4?=
 =?utf-8?B?VVl6YVBkTkhCMk5QOXFRbjg0ZVMyTThzNGYyWnozR3ROQm0zNUpsazNPdlhj?=
 =?utf-8?B?LzFpcWUyUjB4dFRuZmpZWkZCdWtGYzhkWEtoS25KSU9GcHpKcHhaTFZRVmlE?=
 =?utf-8?B?UWlvRXJYM2FZaURMUnBWOWthY0tGWE4xSUhxejJEUGNjWnFJMWs2WmdYNWxW?=
 =?utf-8?B?YUFYZFZaWDRXdnUwRFNJZ1dwdkZUeDhOTGdCbmlhYjRHOWJSclJJaVBKYjFU?=
 =?utf-8?B?RjRvZDBqUjB5R2EyaVczUDQ5UFpIcXM3M3Rqb2lQNGlXNTlDRU16K1o2K0ho?=
 =?utf-8?B?UkpFR3hWd1BwNVlzZGpqa001WkhsNW5xaXlsb2hjVXRvcW1FQURkM3I2UFZp?=
 =?utf-8?B?MmZDZXJpOVpSeDRidDIvbndBTDFnZDNmUHFjblNackN1ZmVkMVA2YmJZTSsv?=
 =?utf-8?Q?phavdKbU4fAYl3SRu2p1Jt0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73018544-91a1-4d86-117b-08d99dfc0d63
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:26:53.2690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yz0/ytgMG9MD7RdOmHFLcA/hWKjchxkVVsEcefB52Zbbv2ZVFPPL2L44H+f3y+IWV1Pc1VhRH/eNMaXZAqt7OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 26.10.2021 17:12, Roger Pau Monne wrote:
> Always allow the HPET to be setup, but don't report a frequency back
> to the platform time source probe in order to avoid it from being
> selected as a valid timer if it's not usable.
> 
> Doing the setup even when not intended to be used as a platform timer
> is required so that is can be used in legacy replacement mode in order
> to assert the IO-APIC is capable of receiving interrupts.
> 
> Fixes: c12731493a ('x86/hpet: Use another crystalball to evaluate HPET usability')

I realize this has gone in already, but imo pointing at this commit is
only part of the truth (maybe the larger one). e1de4c196a2e ("x86/timer:
Fix boot on Intel systems using ITSSPRC static PIT clock gating") post-
dates d5294a302c84 ("x86: avoid HPET use on certain Intel platforms")
by over a year, yet it's that patch'es logic which the referenced
commit merely extended. I am of the opinion that e1de4c196a2e should
have made the adjustment you make now, and hence should (also) have
been tagged.

Jan


