Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210369E1C6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498951.769925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUT99-00042e-34; Tue, 21 Feb 2023 13:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498951.769925; Tue, 21 Feb 2023 13:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUT99-000403-0B; Tue, 21 Feb 2023 13:57:31 +0000
Received: by outflank-mailman (input) for mailman id 498951;
 Tue, 21 Feb 2023 13:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUT97-0003zu-NH
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:57:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad77120a-b1ef-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 14:57:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8006.eurprd04.prod.outlook.com (2603:10a6:20b:288::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:57:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 13:57:26 +0000
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
X-Inumbo-ID: ad77120a-b1ef-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyOgCF3YbPZhxyUDpvEHmTCuDi4o2q3jPZhm2IoHjXFJU50JknKtC4aLvzQ/yP6ACKya1ya2SAxtJXINahyIT36wTNpD8ND+rdg7lX2kt0oxgATN8LMzKCVsdlAbFQ5+xS3z+OsRBqEnj7rK8HWjaECsc8z31iF2Xzr8CWPxEd+rsYBTaEvSN+bRJgDhIujoj5J8YGmAy68KJmo57hedk15PpFkYEkeSppuM1o+a9/tLvf1wz/IoMfg1hNjif84wD3AUrv15yOhGDZPFV7al8uyypeDMcMf2UNM7nGPWHINLwc/oDtMdunMejT3dY2SXLsINEnSVBxSsQzlcOC7f1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umNI7GOz8f8ODLRijF15cVDByfHm1eNx+85SYK6v1Rc=;
 b=KXbIspAYgm3w17B+PJmgJcwnGeve6cXtQ8tKX5KB9tPK5/3g+iuZtkLtVj0HoidaYD39t3c1BGthT2wzk0AesCIE7B2uxcJrNSbANlUFGBxbK9ZPHHlBAWde+4f1XEY+umVQscTVlVCTeMStQvlGLI/bpdqdocbuXqv1wbH6GXKyFVnbducho+p/OpL+lbcaYH3bThS4Lbyo5j9Wmyr4H/2/uJWvn8+kvFpWlYQnXZDIaO/6lNnuXZSQO2y7Gp87Oo8jOi73prvt71qkDFwxAMHeP+TEf9P0PLc33dVVwMaQ9kKfm1NB/s7YLF8BiKXnn5Iw25t1LuaY6ZVvC/ngow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umNI7GOz8f8ODLRijF15cVDByfHm1eNx+85SYK6v1Rc=;
 b=38+Nk03opQqH7aMVMu5hgM5BdT7C6FMc0nCCEr8K3ZNZBNk1fr/anwnHZ5OWT8XLP4uZQleBT00xEs0oqnPDmOShCRfKwqj4gay1/6zndYKvULDtWVvZUpOCR6Xxc4d54odmSyJtaMz7KniNk/sdcGrj/mzKCchwQZPcXvcg44WpYn6VzZoSssEJnBUReTAiGJdCSdqEwoLUFw6xb+9vfs5qK4CN7tNff+6LWpeEIoNikkdAG78bboeUmNEI1ySfRTH7daeGK3YFAYIFZ9xaBHfPliD6pypB0GPLpjepkhCIZ76weNtWCKQZYUzVwFJPhkEq5047JDpolTjiWsEtbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1876699c-b87e-3b90-57d8-f735a5c6e6d0@suse.com>
Date: Tue, 21 Feb 2023 14:57:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/2] x86/ucode/AMD: apply the patch early on every
 logical thread
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230215153846.18582-1-sergey.dyasli@citrix.com>
 <20230215153846.18582-2-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230215153846.18582-2-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: f029e9d0-86b5-47db-4edf-08db1413902c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i98PuhMzqt5i6xrRd7CopbRC27pMktssyqaC81wUADhoad07QcoRl08Zupy4XuBjKb3X6bRmMAOHBnwt6Dnx2J6cJcLCrgsU4dv6xzwfUAZoQ3byDhjTxdgYq0zP8YggMR+pKBuNGzgyYd2KBU4+Ya8bJL3EM0tn41fBSL9qvKrf5hi7mQ+TQI0MWAEPMIvMcjdTCX51kGA7DmYzgCs/C/y8l3fJgMdbuSZqDv7vRUwEY6ZfCQBfgNVejzo5u0AzA+RfFdi14QpQ8Ot3pOx8NB+H+9lQl7++cyD/T5l3EuGlaNpyFik2BCM4mBc6D+yrE957pa25/Ijw3NUV9KwHQXN7m2mwV+o+va2Zg+cON0C9IrLG5ymZIRbe0dGPawX/1mSpYCayrhD/dFhQnX7lFXDprwc7KZTzcFqucrA78yje/zn5JdHro/6YB9+FS6Eu3Rx+43Vcf/k8YpeJe2aTjboelfEcj5HSBSyYee8QZ+eETpyocy7zQcj3RIAWpOJSMaPjeSPT4oL+XoUkCATJcYBpJQgWyKzHK4bhBM9n5/dxICnZZtHZ/3UuLSlkWKElJrojiw21gcdi+8IBK21CwDlYtPJ/0zuJZSLdkZcDwS+BFg6rmgPZeBWNKd6Xsh0GZ7tjsjOW1tTCzNrLcJPUdxhnBIpuXOwAJsB/24g5z1CnncRZWSMN+cr85QVsjEj5RxugWJidcntuCB7o120JsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199018)(41300700001)(83380400001)(186003)(6512007)(54906003)(26005)(316002)(53546011)(6506007)(86362001)(31696002)(966005)(6486002)(478600001)(36756003)(8676002)(2616005)(4326008)(66946007)(66556008)(6916009)(66476007)(2906002)(31686004)(38100700002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eno5d2pnelN5dU9vSXcxT0U0UGxUY2VqRW9tVzdOc0xzY0tSSnpnRng1T1kr?=
 =?utf-8?B?aHlOSjhhSCtFblpHS0F1dzFDbWhRcjFieE13U2NVbENjeWMxcnNpU0cza3dF?=
 =?utf-8?B?ajVGOEtGV3RuaDVxSC9LTGd2eXZwSnFnQ0NtSVM1MUliSFFBRng3S1dUbFls?=
 =?utf-8?B?Q3U3Rm9ZdUtEY0wwTjg4R2MxdDZSdkl2b2dXaCtGVjBkbmRNbUM4NUFqT2F5?=
 =?utf-8?B?MXozTDAvYXgyVWNpT3hZem9RODdCQXY3aUYvRTIxaEh4NmlaUHYxRXlURVgy?=
 =?utf-8?B?TXFpYzFBYVNLZHEwRHgxU0lmWDRHcFFQQWovYTNMTXBOczVtQWtwT3E4ak02?=
 =?utf-8?B?UnBrVm5NN3lUVCtBOTN1YVdNd3doSHBYYTRoOVpuUDZwRFNBOXd6ei9aNFdw?=
 =?utf-8?B?TlpmaExnZDRjL0xTSmtFYU5ZS3ZVaWJtbEpnazQvTklseVdzZzZZaUd2bzNX?=
 =?utf-8?B?K1padmdCY1VDMzlzNzdjNEVsMnNIaFlLek9hK3lDaHhCQWNPQmNhaFd6YzRH?=
 =?utf-8?B?NC9yQ1VSOUlWa21CTWd3Ym0wVWE2ZGNNeGxJMzBuR2hvVHdMSVZiVFo0Sms4?=
 =?utf-8?B?cE14YkxpNDZWTlU0NmxyOHVGYXdpZHI0QkNWeWQyMkNrMVAyYzJNZGVLV1pN?=
 =?utf-8?B?a1NRMDdaL2RJYWtPMkNvWnhRQXJ6dWRENXl0bkF2QmZUUHZzZUl1b25PY0Zo?=
 =?utf-8?B?WkszeUdMNXJtUUhkaFpLSnVORjhuYkJKVndYQWNsUDN3ekJzdFdvSzJTY1pO?=
 =?utf-8?B?L2dYN1Z6RjgzUSthemRTT2FHb2tKT3lkaVhnclV3SW4vS21lK2lmZWcrNjF3?=
 =?utf-8?B?cE9wWjU1Z2txTmE1QnlSdWxlLzRQYm9HQ3B2aUdnOVRSUFhJblMwbUk0dEh6?=
 =?utf-8?B?T0F6ZXhsL0NpV09HeE5uMTdDSXNEKzRFVlQ0ZTh2T29FRUVIekVjakxVZmlL?=
 =?utf-8?B?NGIxQTB6Q1Avem1WaEVHakNzOWhuUE5mUXArWlB4Z2FMbVN0dnd1MU1mcVhz?=
 =?utf-8?B?M0hKUGRMS2x3WU9uOFVRYkFtOGxqVGUxS0NlSkZVdTdtWGtVSnBkc3dnSXIv?=
 =?utf-8?B?VkhQTzNCNFVDR1lIOVkydmdBRVduTXJac1VqTXk3c0VUbTQ3Z29hVnBpcFRq?=
 =?utf-8?B?a2pHS2NCeURwdjFTODFYYi9LVGJYQzNMWEdPWEtyS1A2azhCMXA5N0xWRnNU?=
 =?utf-8?B?YS9remZkUUtBUDFEMWxuUDVMMzIrZjdxL2JldWg5bzI2VVRRRTZleXNDaEtO?=
 =?utf-8?B?TXdhY1hFSnlESThxM3BhSDY0TUc1Y3R0V1o1ZjZEMGYxK0Yyby9KOVcyWVZh?=
 =?utf-8?B?cGdkbHAvQ2VTcUVGOTZUdXJ0Yk1BY0w3SEpVUlBSRXZDVENuVnZBUzVvRUx1?=
 =?utf-8?B?aE8vRld4ODFNbGRJS0lleUZ1a0pQampBZWR4L1RTUjE3K2twcGVGRzFyOTh2?=
 =?utf-8?B?aUl4UDcyY2ZIUG0xMjJCemhyY25HenRSQnNUMnJVRGc0L3lwOHpYa1dMSkZB?=
 =?utf-8?B?bVF2M1l6c200VDlsbWhqbk9OS0JhR1FTZmpHOWZ2ZUNxbW5Vb2R1NC9iaDZS?=
 =?utf-8?B?cmZjZkdtOGJPaU1mdW9PQ1VJYlEwTFhiRlFKb2UxZ1RoaEhUMzduQmRuMWR4?=
 =?utf-8?B?K3JiVDFSMVJFSE9BQmpTZFI2Z2FGbjBDTzlQL0E4czlGMVVKRlduTVZ6ODB0?=
 =?utf-8?B?SkFKUlBhN09RRlpDM2ZXUm5tdlF5SERDWkF2Syt2Mm9LS0QwWmViQTFIeTVx?=
 =?utf-8?B?UmY5NXp6VElHK3FwelhXMU9RWDhLaUNRdkkyWkhTdzJRK0pNNERYMzhMNXVu?=
 =?utf-8?B?WlQ0RUpiRnVJU2diUUZvRi9OOG9Ba3RpVTI4bUsrWkNTVmd6UGFDQXJ4RmdQ?=
 =?utf-8?B?Wm1ZYWVpSmpnM3Fpc29UNUZlYm45aWlBZFJ5QkN4eXRqcVpqWDJnMEQ1cTMw?=
 =?utf-8?B?M2lmN3h4MkQvT0FpcVJkTmpWUm5sS3F5VFIrc0FhUmd0MnRzaUxyeWRSWVlJ?=
 =?utf-8?B?VWtmZTVtdENwVXhWUkJSNzk1MHRULytHelJPWFJMY1JvWEdGTlVWeEVnZitX?=
 =?utf-8?B?VXRlZ1dLdkwzUnYrNmx4Y1pPOG5uUUM1WXFUTnM5TnkyeWU0UDMxVGNqTGlL?=
 =?utf-8?Q?OIA0Fx3944voT5n8YT5fDlTEG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f029e9d0-86b5-47db-4edf-08db1413902c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:57:26.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iA6g9IilP9nOEEXxPrj47+nMPz5fm5aS0ikBlJSy05RIDp7eIlYadCpyHTtmb5uW8ARIpXKc4Y0YAQl/IRCQ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8006

On 15.02.2023 16:38, Sergey Dyasli wrote:
> The original issue has been reported on AMD Bulldozer-based CPUs where
> ucode loading loses the LWP feature bit in order to gain the IBPB bit.
> LWP disabling is per-SMT/CMT core modification and needs to happen on
> each sibling thread despite the shared microcode engine. Otherwise,
> logical CPUs will end up with different cpuid capabilities.
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216211
> 
> Guests running under Xen happen to be not affected because of levelling
> logic for the feature masking/override MSRs which causes the LWP bit to
> fall out and hides the issue. The latest recommendation from AMD, after
> discussing this bug, is to load ucode on every logical CPU.
> 
> In Linux kernel this issue has been addressed by e7ad18d1169c
> ("x86/microcode/AMD: Apply the patch early on every logical thread").
> Follow the same approach in Xen.
> 
> Introduce SAME_UCODE match result and use it for early AMD ucode
> loading. Take this opportunity and move opt_ucode_allow_same out of
> compare_revisions() to the relevant callers and also modify the warning
> message based on it. Intel's side of things is modified for consistency
> but provides no functional change.
> 
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



