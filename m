Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1D93FDF0D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 17:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176537.321229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLSWx-00077O-Sd; Wed, 01 Sep 2021 15:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176537.321229; Wed, 01 Sep 2021 15:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLSWx-00075b-PS; Wed, 01 Sep 2021 15:52:03 +0000
Received: by outflank-mailman (input) for mailman id 176537;
 Wed, 01 Sep 2021 15:52:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLSWx-00075V-4K
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 15:52:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1642fdd1-e56f-4bcf-ae0a-0e39a73f0556;
 Wed, 01 Sep 2021 15:52:01 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-5N_FybicO5GK4fwW33LkwA-2; Wed, 01 Sep 2021 17:51:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 15:51:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 15:51:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0017.eurprd09.prod.outlook.com (2603:10a6:102:b7::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 15:51:56 +0000
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
X-Inumbo-ID: 1642fdd1-e56f-4bcf-ae0a-0e39a73f0556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630511520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDUxKs17CBRyEk1FI7eJvE3umkbbk3O/fEeF6QKW0cg=;
	b=EHjzOGsFJpi3XeMDuHI20cTqO3YUZtuBXbcMePnicEdbL3LV3F3TnG8FKblI6V9GU25sVQ
	dMhAn1ufylATYLbhnaAFNuuSt6+jjppRBJMU7gsH3ON01J/WPHdjF77S2+1LW3PcW5S9+j
	E3HPHQyKLpsX+3ybeb8dGiTaOhCRC9E=
X-MC-Unique: 5N_FybicO5GK4fwW33LkwA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gk8N2VnkqjKffSgjxCLbiPTQs40owmPlLJsXp4oEjqm6t6KOtI0hNgdNerZV25Y0hzGetzG9WmqNhtzg7zzGJPMSjJkKc0TLKCGaTK6EY+zuTbA4/s5H3kwpLDkKwA9XvrJe3+37UGszrkDMZ5SezPaT6OukqhKTr3PvToA/E9HXE13iXeqVdnejRGQY0007jKjKX7FqW8SyMOaXcO7Al4oMF5q9P94bgvdsJRQS8HMs1fgjsjv86oS1zOYiNfKqiOdqKiwUETVIfpO8ECLoPGqxgGOB5py6xWtnrDTAAwPSy6GhT5l3GwVXgQd1N6jdIWo51iiW3NMb6CuFixCFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDUxKs17CBRyEk1FI7eJvE3umkbbk3O/fEeF6QKW0cg=;
 b=H0gxnNBCyS13nzEsQDbay45/XVyIxd2pcUBQF2pl6UzgbIYFE9mOD2RyISD6H69siqDZ6Am0957f8AkdTpUV757DCOnb7jyad4I4nYs9Ae+0KcX97DhG9re6a1ijJ+5aAFvAqWyjIzXuCp1j14vRbXfUV7/dze1JQ4YToziES1bri6cGizGQJsP5a1ftSlNuHaQC+rZ37h9J92VgKVwg1rd081zOLtiQGwZBdc30a6K3rc7z9+PfW0uBgNYwSGiZ4sB9VTHtqJIgoMCRZqYQVyS/IOxpLHO8BgojhThsfUX9H+oHdFMJYXvO0CwFMWzdQArj5al8gTG2nUYU1fX52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 0/4] x86/PVH: Dom0 building adjustments
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <1d600035-851a-190a-f744-8cd7b2d887fd@suse.com>
 <02ebe247-6891-dbdf-82f7-5b33b5a08dd5@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32638483-c44f-d2f7-a741-c51dd98461c8@suse.com>
Date: Wed, 1 Sep 2021 17:51:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <02ebe247-6891-dbdf-82f7-5b33b5a08dd5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d62c22a7-a491-42dd-81a3-08d96d606d25
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2960B098BB72B3D28C741454B3CD9@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z/BhyqfxnNuO/PKuyx0HTtvAAWSdjpB0asnAgOtB1GaqSMT2+ryrZIjBguJtFCzZgiHCdvzJKbLY2VhezkLHn2y2bfIY9CACJ4vVv8oPYc5B1LA1epJ566z15ul8OAIfBniZe6iaoYfN9KMQHY5vKmzfo/X5npTpFzGFWpHRtfVMkuoQApIxPcKjMny3M01DYmHYodw+BFl44drIPvbMu5Dyo9Xo1MnYAFMtqSabFVYvceKoJ3jIW+tOKSbO0KiLxNPTYWljs29wmqH/1OTFDpSbX4IFieeYgPePRXj7I4JM5BcVBA9vh9ui6PsFdvtfcrXLRr8LOfWq91HhctF87VpJlXjBcXu3yo2Cy+oaTPOxCAYjNdwZ4M90Zkfj7pFdwULGPXOVz2uUg4ZXijVIHLSGQcswMlw3fjxF61vIo4y9PpstdgGNUDPwQS6rnf4Q75hYVY8yeRbSZUbGxA/Fvim3vTIlwgJMwamU4kbUX4a1z5ktXo3zjvPckJnQzuFWgp+4TGWHUw/gPF5y8q/xDVdbXmeTEi+qe4KJSBG/5OULCVAlPFhTi+8SjrmR6KAVo1Rdk4pkK4e9clqDste80cnVyHyIAb8B5wSLCzuLvXRIgbZEV1NTWL9Tslnfkal5E575lKF/k9sr/UDlqdn7IKCxZMm4QkSKDGsFRqZPAJyBuuGYhEBGbLJDN5qh/JOCgDAvnPcBUwigUSaYILG7wZE1IYEHaMTf0VQQFem4Lvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39860400002)(396003)(8936002)(5660300002)(53546011)(66946007)(36756003)(37006003)(83380400001)(66476007)(66556008)(6486002)(31686004)(6862004)(478600001)(956004)(86362001)(31696002)(8676002)(6636002)(38100700002)(2616005)(16576012)(4326008)(2906002)(316002)(26005)(186003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmFzVHVzRFdDY1UvRTJkSysvdlRMY21HTEE1Q1RJcnBPUExva2E4MzQ2L0JW?=
 =?utf-8?B?N2VTTVNrb2Z2bGQ1SFJqbFFIaGQzWm5OVWR2dXFOTWdFck0vWFZGK1FHeGl2?=
 =?utf-8?B?Q1dKaTE2Ti9meWJZaDVZM2Nvdjk1Mi93cDNNaXM1UHJYTGEwK2dka01Yd0VS?=
 =?utf-8?B?VlVnK0tuRE1UbHEzSS9VZVhyZHdsN25oNlMwaTNqbll6VnZFNmkxK2ZOeGJW?=
 =?utf-8?B?cnVXTXcycjViWjI0aEN5aGFDaStHM1pvc0FuRlNyZmNQSlRvK1dxcENLWHhB?=
 =?utf-8?B?eEEwNjBOS0c1K2puMHg5cThCcnhIRWU3dXd6NHJNcUxWT0N5a0RxbXB5TDFS?=
 =?utf-8?B?dXZsS2VqL2RzSVYyUGlaRDFjL0hURHhITmVQQmZ4alhaOXllbFNhWW9kQzI3?=
 =?utf-8?B?S3pxMkJCSEZyM0RVRzRsNW1PdDJuek9zcjR3aDFrMTkrZ3E3aURlSXo5bWJU?=
 =?utf-8?B?cXpmdXFlajhydGRqazgxa2ZzZ0FVT3hsRm5iZXdWalAvNVBVbS9xaUhPQjk0?=
 =?utf-8?B?OFI2NzZ6MS9VdDFyZ092bUUzc1lyUVhUSitrWGJiRGVjZVF6RnlEZnV5dWlS?=
 =?utf-8?B?TTRBNkN6WU96ek1iYVZQbnoyanNncVFDU3FWcWowTXA1NUdJcDRSdXRGZXBR?=
 =?utf-8?B?WEM5dWxUVk9rVjF4cTZjTWNHTGxteDFRdEhaNXEzM1hjd0dFT0VIQ1BLQTJV?=
 =?utf-8?B?SGI4ZEhESHA4ZEI5d2g4VkVEdVVyTmZHRGpnYTZMeEhKL3NpZnYxaUtBN0Iy?=
 =?utf-8?B?RlZzeW9Rc0dnZ1U5OHNYVnFiTng3V3pmVTRCTUx0eVh2TGplMGFaRVBmRG5I?=
 =?utf-8?B?ZjhSdzlzenBLWHhuNFBWWVRYMm1YWmpPakFrS3FrYjloa0ppczBqQVZvR0d6?=
 =?utf-8?B?bHkyRjZTeUxSVXR4eiswQWRlbi8wRlE0OEhPSEN1RHNqblR0THJZcUVmQ2Fp?=
 =?utf-8?B?Yk1aNUFLYnh6K2F1SEdpd3hNYkQ3dm9MYVFqcmJ1TXY3cWIxMWErUldKeGt0?=
 =?utf-8?B?cENkaXFUMkU0RTR3MkpSdndBY3VyYnJaZ2g2U2l4YWpWTUdaNWE0NmNLaTJO?=
 =?utf-8?B?djZtQTZsQXozTDBxM1ZZd0lPWEtvcjVsOEhlL1V3Um5Gb0FZT2FXNnJZNDBr?=
 =?utf-8?B?RkprK2VkbUN0TERCdHpWaG5GZ0VkUVZwdzYwSjZVckJlUGQ4TEtuQ1JxQVFz?=
 =?utf-8?B?NURtSlZZRjVQOHdqUWxRajdNckk5dHRoNkExVnRwSUljanBTV0wzTzltSExQ?=
 =?utf-8?B?R2xSdUQrYVRKaG1jYnhVSTFzckhVaVJKTmMySFBJYlFLT2pLMXVhK1FEUFJB?=
 =?utf-8?B?b1FiemhIOWhlSWFNSDRwN2YzM1YvUmpaTlY2ZDQ5UHE4VnpSM0N4YlNJUFl0?=
 =?utf-8?B?emZZK1psbFRXdFI1QW5BQ2hsSEJGMUh4RjlIYzlqcFJ1MjBGT0NkYkczL0x4?=
 =?utf-8?B?N21PMit2WWZ3TkRFQXdqVEk1YllBOHhyOTNuRW4weTNucm1xYy9ScXJLSHJN?=
 =?utf-8?B?TWE1b2pjKzRMbTJ5aUNReFdzeERFSDNkU1Z1Y216T2w1bnE4cTlUUFBDdkRk?=
 =?utf-8?B?VG9rcDBWWlZyblN4ZE9uUUhOWGFhRTYxL0hPRkpOQjNYVE1HQUFGczVTMTc3?=
 =?utf-8?B?Z0hSQ20rdytiaXlwWVpjOWtMbTQ4YTlFZlNEaEVacG5uRENBN0IrTTZveWZt?=
 =?utf-8?B?dllyamJ3NjNBV1VNR3BEYnQ2enRRWHk2SFNXYmNpM2tnR2pSdGFZcFRuMndY?=
 =?utf-8?Q?PZ6xtpSK0V/fP1C1DZowbOeOkCvq0bwADw5B4YK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62c22a7-a491-42dd-81a3-08d96d606d25
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 15:51:56.6477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVOOVHIT9fBOhPnyV7BE3owEi0dcsSlOXtaNutaeWvOCtTzuEXd4z/SYd+eKYY9JylT/DXQnACs2BT0pqsHJ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

On 01.09.2021 17:24, Juergen Gross wrote:
> On 01.09.21 17:06, Jan Beulich wrote:
>> On 30.08.2021 15:01, Jan Beulich wrote:
>>> The code building PVH Dom0 made use of sequences of P2M changes
>>> which are disallowed as of XSA-378. First of all population of the
>>> first Mb of memory needs to be redone. Then, largely as a
>>> workaround, checking introduced by XSA-378 needs to be slightly
>>> relaxed.
>>>
>>> Note that with these adjustments I get Dom0 to start booting on my
>>> development system, but the Dom0 kernel then gets stuck. Since it
>>> was the first time for me to try PVH Dom0 in this context (see
>>> below for why I was hesitant), I cannot tell yet whether this is
>>> due further fallout from the XSA, or some further unrelated
>>> problem. Dom0's BSP is in VPF_blocked state while all APs are
>>> still in VPF_down. The '0' debug key, unhelpfully, doesn't produce
>>> any output, so it's non-trivial to check whether (like PV likes to
>>> do) Dom0 has panic()ed without leaving any (visible) output.
>>
>> Having made '0' work at least partly, I can now see that Dom0's
>> vCPU0 enters its idle loop after having gone through all normal
>> initialization. Clearly certain things must not have worked as
>> intended (no APs booted, no drivers loaded afaict), but I'm
>> having a hard time seeing how to find out what that might be
>> when there's no output at all. PV Dom0 does not require any
>> special command line option to do output to both the VGA console
>> and through hvc_xen (making its output also go to the serial
>> log) - is this perhaps different for PVH? I couldn't find
>> anything under docs/ ...
> 
> Did you add earlyprintk=xen to the dom0 boot parameters?

Yes (I did mention this before) - no difference at all. I guess I'll
try again, just in case I made a stupid mistake.

Jan


