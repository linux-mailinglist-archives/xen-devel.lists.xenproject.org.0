Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1A7CBB59
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 08:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618055.961287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdf3-0004MJ-OV; Tue, 17 Oct 2023 06:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618055.961287; Tue, 17 Oct 2023 06:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdf3-0004K0-Ls; Tue, 17 Oct 2023 06:34:37 +0000
Received: by outflank-mailman (input) for mailman id 618055;
 Tue, 17 Oct 2023 06:34:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsdf2-0004Ju-IV
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 06:34:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c135a09-6cb7-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 08:34:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 06:34:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 06:34:04 +0000
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
X-Inumbo-ID: 3c135a09-6cb7-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPPkMaIRiaJUKAcvwYVcqwvTHF/8t9XZ3M1JWAopUcsEshKXPsuX2WFGQDIc7p9Fd43U1+dSlEK58SMClWDN3luaw90JrmWTwjyUy/vP6i8xNhLnrcOSHPAVsSmVBkewZmDRt9rcgSDt2FcZcoboNbDMD0sCDJvm9kHffCCdU2QoFpmlGTfE3uI4NI7v7cgCtpNUgBEoE6pYq58fw05PmxRnrkSH3ot/EyGzuIMsLncOlBxkhH+YNyj+1kNSlbHnxEaK4py2GwNWDT3EcPjg3EhrZBz3cw15fAZWvp1eAh6muK8E6BK1Cnl/9P30XMKu4RzTjiNh3oTei6ebYj1Wcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXTp2KOb+EVk+kvfHWNRlP8ZRauJZo6Pmg9z/mTuBEE=;
 b=U/uvfMmFrEXhHQFw1VsZfTxvenvIti4xfzDX1R6Jm11LIqmy5fHmtk04d+YVGX8CZDWVq34TwyVyagGG2H0B2T0sCmTxdd8p6q/TTMT4U0T8POtD45xVdDf54+BUNhDQsVt6OhDcrDtKtnR3Agbl2f7R+B/gUzkgvw8L3USpP1FmAPzoFbGlbAppQH9B6pAWMFhWW9uYBvGszetJU9gSyPA0JibOWgJVihAsbsbKACsd/FzqPVHgJay4YfklSwmzE7plo3jYUboBkqfwNTr+eGmhB33y2PaPZVqVN4i9Q2jSGUIO2YjBv+SCctSRjhRU13OCvv3ihzamst05XqdH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXTp2KOb+EVk+kvfHWNRlP8ZRauJZo6Pmg9z/mTuBEE=;
 b=jwWbmV7zPzYOzSsAX4LEpWPw6mi75QwReSDpstw6Os5J9DiRCXMxzSaeiS1VLm2i51e9tImujFxN7sc8dwDe3P43PfSj7CYxKbKfEeSMQdN1BJxEfpmLxtX/+Ms6lOiCVh7hBHtfIOVLIFuP1//Abqme6JR2dYzh1t8KANs/7PRFgck8e81HT2JPAcTlkhNPmZ5AbbDaLxA3EYKg3IBIgFL646BBpfQGTQ1CCIqJR5fVUnll1+wSoHFSfLCvagS/8ylyNDA/MqTw9f4um8KEKU5MYU0/cByvuOWxbuIG2gTGdxpGKUvm4RIE9zrqWaLLDH/LHcY4pSDD3HVQWgpqWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90e657ad-4109-442e-2b26-52cd2372f582@suse.com>
Date: Tue, 17 Oct 2023 08:34:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] docs/sphinx: Lifecycle of a domid
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Henry Wang <Henry.Wang@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a361402-9db9-45a0-8528-08dbcedb0e7e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1cdecKVOavrhUed1f/yo+imJu/FtnlDwuiqNM+m7JrJm5mEDlZxhhn/CpIYHiGQt5n8MYpohAIOarqE0YyeBhz9zacn3wb+C2thfNk9d+ReYsyNB+sqYafFvwcOFg/c/3oNPFah/Qyw28xxLdeoKhjDVIoQjaAEtZRpxWtBtfuHVzsxvXn+tyX0rmOJJAmRvqVa75P011zGnL/b8bkIM22QEwKZ+rrBI+8ceyQ/eXpPbtW29g+WeoZnC9Ijym2PGrl0w5utso+OHIf1TuVVCnN9tqzfmC1UgEe+SzILdYM2HRagBHka2LkEr1tX/3Rga6s/HgEi5rG60YWZeq+ffcFGtFaHAIab30Gdes7+rZa65dzVPJQt9OowtCtmTi7pt+9Rzo13Yz7jDogBSHjA3Be7uIzEbd7zbvyN8UekWd1pP6WHIRYM6UmXylSzXT7osDHtaBoiCch22E98SQObqn/N4Zdo0Mlm+Cqh8reXTFxoynmnRCTsb8gV5ALCz90XCC/iWjXdiiQT1g1CkVNJT8rvpWARxDWwr+4XfeKpUN5CZYnhQqcjvFlzgTLINok2l6BkzxuD9kfeL9F+q2EjDSrIEbrqtN636+39c5oeRSUfFv4b7pfwTSihJTg4ovEC4AMwMEZQMw6lXYatkTPSl+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(8936002)(41300700001)(4326008)(8676002)(5660300002)(2906002)(31696002)(36756003)(6486002)(86362001)(6512007)(478600001)(6666004)(38100700002)(83380400001)(6506007)(53546011)(316002)(54906003)(2616005)(66556008)(6916009)(31686004)(66946007)(66476007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFhkS0JENitXU2d3ODErUWJSaVpuM0ZJK2hJVDQ4ZkN2Zmo3Q1F4em5HRUdL?=
 =?utf-8?B?SkJiMGtoSDlIdGhPMlpQYWtUTXk2eVVvUDRxVlBsSGlURlRJZEpQVXNJdzhZ?=
 =?utf-8?B?NXpRUENHaVBZdUg1cm1zMDBtMnBTV3FEZnovek12WUlCNGdTWlo3NzNFSjJC?=
 =?utf-8?B?Z3ovT0ZKZXdjd1dNVlpXWTYxN2RRWmMxUWtNdDZNazJGVG4rMXU3Uko5TjR6?=
 =?utf-8?B?YlpHUDlFMGw5aDl1S0xZSXFpS2JYdzVZS2l0UkNqNk5tWmliTnhEeHJHelpz?=
 =?utf-8?B?YldMM1BlTFh2YWhqamlzTVdya2hxMm5mQW5lUkZFME1nWmg5bXNlVDNNM2gw?=
 =?utf-8?B?WlNSdVpSazRLejR4TERTeGJGSmh3M3ZXaXBEemhQVkRzenlISU9rRzMyNTBV?=
 =?utf-8?B?bjFSMWtOSm5jREhBYmM3TjVPYnhaSkx4WlVhcEFqdHVaTzk5eUV4NlVwSy9s?=
 =?utf-8?B?YzIycEhmYWFIZVhoYjA5ZEpuaVhmRWhMejk2NGNaaVlKOEpHRkhqZjNPQXYw?=
 =?utf-8?B?eGJXUUFrZlY3YlFjUzBOejROa2hWaGpUSU1oY09FWUNCOE5xVmgvdW9Zb0dZ?=
 =?utf-8?B?VXZFamczTC9ZYTcrM3BPejZXMmFlYnhhTk1wVnBqc2diL2ordkg3aVh1cEtZ?=
 =?utf-8?B?RG1CNjhtTTFRVVprVDQrbStScWxrRzNGR0pHT0FiN1RZYWo3K0hsTHYvdi9M?=
 =?utf-8?B?QXZwOVd1YXhUMGZPTGNmSkMyM0FBcVcyS0dvUUFPeHgzU2w5MUZwNzl0RFVj?=
 =?utf-8?B?Uy9DUW54MGhkMUswdkJudlEzVG1Ja0FkWGt3QkM0MnNxTDNQWWF3VG1jTTBT?=
 =?utf-8?B?aEFkckRaOGpVcGl3eklLV3dGOGhWQTdLcUd3SG44dkdpVjZtaXMyWDN5KzBx?=
 =?utf-8?B?eFZmUHcxUXVuVG5kM01pektpZ0dmTXNKTTd0L0JYTGNFQXpaVVFSQ2VLNEwr?=
 =?utf-8?B?U0pjRWdOTndEelZlR0tvWHFiQjdDRUhCN3ZHdnZoMmQ4QlpiRldwS2FpMGxN?=
 =?utf-8?B?WlRWWUVoR0lKc2JJTXRvZHpiOGY0MnJ6eExURkZZSVo2dzgrTndVSWxYUHlo?=
 =?utf-8?B?NTZ5aHFXa3FJUnlVMFNoS3JQL0JxbHFrMmRtcGxsengybTJNdW81WVJEekVT?=
 =?utf-8?B?K3l3MUJwK3grbzFUa1dZbTRCSytzWm0wWjhWOXlBT21mNEJsRkM4WlJvZ0FG?=
 =?utf-8?B?Q1g2YkdDYmo0UlZUSDlyTUtvbHFmaXB6SWtHNEpkYWkrNkszeGlvT052dndY?=
 =?utf-8?B?dEZTUTAzTG9SL0RYQlRDbGRjTktudHlMRnRickZvVFBYR1IvWFRUaWZZcm93?=
 =?utf-8?B?Ujd0VFBwYzJLUUhDMTVSOEhubllRY1JidlpFblp0S3E1NGtRc1daTnZDcEhx?=
 =?utf-8?B?dStRdDFndGlTOGJoS0pBNWdXRjJ3NmhpalVtSHBBZ2hrRXFrQjNHUDBXbWJH?=
 =?utf-8?B?Y1ZZOE43MVdycEJFTXp3N3IxeDlKdWhQSjc5dUdkNW5DSmE1dGdvVEhLdDAr?=
 =?utf-8?B?TmIzeUsrMWxVMzJkS05zdG94SXMyMjdSZmNFbGM2bUkreWVSZFYvVnRzdCty?=
 =?utf-8?B?V1FaZjMxUzJncFNIa1htRGlYWEtnSCszVXlNQ21FclphajVuT2lKNUJDaFVs?=
 =?utf-8?B?R3lWNUZvb1N6Rk5hMG9jcStMM1U3NHVCTDc2cCs3RnhOTE1TcUppd3JsdlJL?=
 =?utf-8?B?ZEh0UUJhQXV6Z3F3eFcyZnJMaHRjVCtjdWI3ZWtQbWMrUnJjL3pKMXVvcnRL?=
 =?utf-8?B?Rzlhbm14ZFJ0ZVJOQ3JOdjVEbVBzakp0NEhyRFRQenV5M2gzU29abWZHcFlI?=
 =?utf-8?B?anRBLzA0SDEwSTFaU0JtVm5MZVFsQ1lIYWp4SE5MV05CLzNhZ2ZxbnBXWUtP?=
 =?utf-8?B?SW1wVkF6RVAvRmZhTlgyU0p6TGNHWHRYMXllV0NEazYzWVBDdVRYT0hyS3hZ?=
 =?utf-8?B?bm5VT0VGblh2dXd6SHltUld6Z3VZNXg5Rk9La24xdE5vUk1WYUVzY2FWRlM0?=
 =?utf-8?B?Tk5mRmJwVFJUK2dKaURKQ0tUVVNBbmxHVGZPY2dtTTlDRlRCZ0xHRE1heElt?=
 =?utf-8?B?OWFXRG5YRUxxcGZIVjdUNW1WTnFISGtkV2hLSWczam9TdVU3Q3BGeTgyNnBh?=
 =?utf-8?Q?Nvb1S7BkK7BjraTrTjCtu3VA2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a361402-9db9-45a0-8528-08dbcedb0e7e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 06:34:04.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SPWTT1k6QbOa50jBXoIObsUI6gdhIQYRRM7cv7sFvHMfZdVDjglEDMpVXwAq0P+CLqkbnM3xp6QHGR7griwEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778

On 16.10.2023 18:24, Andrew Cooper wrote:
> +Creation
> +--------
> +
> +Within Xen, the ``domain_create()`` function is used to allocate and perform
> +bare minimum construction of a domain.  The :term:`control domain` accesses
> +this functionality via the ``DOMCTL_createdomain`` hypercall.
> +
> +The final action that ``domain_create()`` performs before returning
> +successfully is to enter the new domain into the domlist.  This makes the
> +domain "visible" within Xen, allowing the new domid to be successfully
> +referenced by other hypercalls.
> +
> +At this point, the domain exists as far as Xen is concerned, but not usefully
> +as a VM yet.  The toolstack performs further construction activities;
> +allocating vCPUs, RAM, copying in the initial executable code, etc.  Domains
> +are automatically created with one "pause" reference count held, meaning that
> +it is not eligible for scheduling.

Nit: Afaict either "A domain is ..." or "... they are ...". One might also
add "... right away, i.e. until the tool stack asks for the pause count to
be decremented".

> +Termination
> +-----------
> +
> +The VM runs for a period of time, but eventually stops.  It can stop for a
> +number of reasons, including:
> +
> + * Directly at the guest kernel's request, via the ``SCHEDOP_shutdown``
> +   hypercall.  The hypercall also includes the reason for the shutdown,
> +   e.g. ``poweroff``, ``reboot`` or ``crash``.
> +
> + * Indirectly from certain states.  E.g. executing a ``HLT`` instruction with
> +   interrupts disabled is interpreted as a shutdown request as it is a common
> +   code pattern for fatal error handling when no better options are available.

HLT (note btw that this is x86 and HVM specific and hence may want mentioning
as such) is interpreted this way only if all other vCPU-s are also "down"
already.

> + * Indirectly from fatal exceptions.  In some states, execution is unable to
> +   continue, e.g. Triple Fault on x86.

Nit: This again is HVM specific.

> + * Directly from the device model, via the ``DMOP_remote_shutdown`` hypercall.
> +   E.g. On x86, the 0xcf9 IO port is commonly used to perform platform
> +   poweroff, reset or sleep transitions.
> +
> + * Directly from the toolstack.  The toolstack is capable of initiating
> +   cleanup directly, e.g. ``xl destroy``.  This is typically an administration
> +   action of last resort to clean up a domain which malfunctioned but not
> +   terminated properly.

Nit: You're the native speaker, but doesn't this want to be "... but did not
terminate ..."?

> +Destruction
> +-----------
> +
> +The domain object in Xen is reference counted, and survives until all
> +references are dropped.
> +
> +The ``@releaseDomain`` watch is to inform all entities that hold a reference
> +on the domain to clean up.  This may include:
> +
> + * Paravirtual driver backends having a grant map of the shared ring with the
> +   frontend.

Beyond the shared ring(s), other (data) pages may also still have mappings.

Jan

