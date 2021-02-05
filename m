Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F1310DBC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 17:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81848.151336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83p2-00055Y-Ow; Fri, 05 Feb 2021 16:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81848.151336; Fri, 05 Feb 2021 16:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83p2-000559-La; Fri, 05 Feb 2021 16:19:04 +0000
Received: by outflank-mailman (input) for mailman id 81848;
 Fri, 05 Feb 2021 16:19:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB+w=HH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l83p1-00054I-5k
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 16:19:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba5ecc28-768a-4d7e-88b4-26c38e1f36d7;
 Fri, 05 Feb 2021 16:19:01 +0000 (UTC)
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
X-Inumbo-ID: ba5ecc28-768a-4d7e-88b4-26c38e1f36d7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612541941;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UqYSAjHvVVlXP0efegEpgt7oYTzFjqMGfGwZRX/sxr4=;
  b=Xc56JOcPwfn/eswtR21yOVP1hl8SjCDaj4iWb7PHB+ol6xeI/G5C4U0O
   7nX9rt8c3Ex/7IHr8aaSuX89ixyjCoY7C5KoPJBgZodNyhcdbw/JTdPD5
   52YZTkM1CRJrvRfbgrSu5ZEYvKGkTuG93txsuMz7ROP3AVkR6gZnmlyIP
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NqSno6kXg1aMleDRpNHKPuxfL8+dHJV2A0YXlmbPUylHwJLN5ke/ZvnBhimVm9Z5GVvWQmpjEt
 TpWlYPNK85aVuxME6oNdlnfjO0vdvVZYlERa/HNj59cWh/jDsR7dawuTT19HCtDqza/UgAyIQI
 4tsf7S1g+nSRT2hJp2e3Sa4EMsMdFP1AVq/7iOTCe317tZmdzEnvFXu5RlKWjxL7R/0jgEfnO5
 wsyxNHj0On7ETbqww6M7EUyaoBrt5/DcE+m4QFICCZwKw8ZuJhfMVqBYf8qwop6iYX9gpOlJDg
 8tE=
X-SBRS: 5.2
X-MesageID: 37030604
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,155,1610427600"; 
   d="scan'208";a="37030604"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFfexuSUFGqhlqKKm493rOYXGepCX9alzz2kCwV/AuQ9536jE3zEFWsj7znI3qUVzgLsrOXk71RKK7dO+kbO0msFiWwn80pNMiy5ZE44GpJ3V6HO1dmBvDIgy8478q6ay4emEDriDyCbkuYfyuONKcNilOITM4rq72ZiREi+jMnsLRZhU/x/izvhPbBajaYiCfJwEvODcxWH6+mcUZwpNrXY+XtdzO2F8xTFMcPBBCr2gzm/BuIbwhx7aPDvGZoeoYOZC7xDXfZHZoTasi/qnVNIs9RSxSCkbDGz06TB3hGDCd3pVpqgSdnLudeWDGmorFwcTkyqZHKzJpNOdOEVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bAEeOhfQmJAQk6Ge3ef0Q9NgE3gNZDzR1tRMu6dHu4=;
 b=A6YZ2mWwWFdvJpTZtQEZHexoV0L/PCsMEyaeVd+BTT8Dl1lF37JntSBgTRXMW92W+GFFPfEa0hiMpwpszkln/XTJN7cT/6ZsjDXdd/a07/Coke0Z7xPXVln5VvixI8+ZDz5BfYzaXpmZycE5LSDtXSn7yorQBHK7/hV8N9+QKuq2AYWWlcXRUy+5s4YejWbRFTdP5Eph3+Rd0XvC1HEOkyTFmZGk8Jq3JoL6BAKYJoATXciPOviNumwUezy5pj4zikOOum0C8zweEiMTbrQbq/UZvEfE/81f7F0t0rRNOOc0nfCkZoBEGm3OwfekzThFTZJbKG4qOD0drq/B2xsgcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bAEeOhfQmJAQk6Ge3ef0Q9NgE3gNZDzR1tRMu6dHu4=;
 b=Dt+GSbu67ifPdrMlyaTfJhDcZ2AwApcA2gE5hKEEun1OwikALlplv6ggnKbVK1HkAptVCzjCuz9HvCu86lJKerZZC49rj6DCOKfLSldFhbP06/JleZHFXsxKauk5wsium7hmrwRTrJJNujfv+U9x+O2Z3Nun4kqZunrb+PdMrgc=
Date: Fri, 5 Feb 2021 17:18:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
Message-ID: <YB1v60CuOdhxFwNy@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
 <YB1nhBeMRVGyO8Fk@Air-de-Roger>
 <d23dc40c-3b37-ade2-f987-4f79b06901b1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d23dc40c-3b37-ade2-f987-4f79b06901b1@suse.com>
X-ClientProxiedBy: PR0P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f5aa6c1-d177-4827-9bc3-08d8c9f1bcb8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4603B88E5768F98E1F1ED8B48FB29@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WuJYWs9kEN5rpU2OKb1/XksmtXmNE1x0QpsYGrnHs4PFLmBFJawzBOi6xu6r5JmZwZNOr/IGmx6oiM71SF2yJ9ILvk2O7OQ8S99pKRHt+xJXF1tmhYXrWnDgb2sdvJmpSFLz4OXyoG9NpxIqg+C9bqWoukwhRMRnbLg/XHocjXWdammQXLO2KELwHewlkHjr7iEn2eEecNdhD8sBgLFrdq/WJniUzbcpKTAWQEAEnjXutv8beJOXLo/mJd4PnADVWVsBmrQjXOIyB8BJi5kXB3wijJENdWm24WKE7Gs2AJdThYZCCWho+/zip7CXpeVmUvj13HLFO83pUm6gq79Uesgi6WfHB+Ip/bJ8NGBJSgWOwjb3fC6zo9nvwppop1spIfci0qgd4EAuo2+YNcaTDeDvhWGmelnLVUK7kJXOILbDvBky9bpxm+nCIDv8tK28coa7ErV5FKbB/JTB2ZrTcWlfXULf5rciG7l55whMmpOhlRRMwaqtFqjOSV2W/f928OrkKL6dFWY3yScirYZziQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(316002)(8676002)(66476007)(26005)(107886003)(2906002)(5660300002)(86362001)(6486002)(66946007)(8936002)(66556008)(6666004)(54906003)(186003)(83380400001)(4326008)(6496006)(6916009)(53546011)(478600001)(33716001)(85182001)(956004)(9686003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dExSSlQ3L0FpZDFGZDEybW1YQkxWZ0kwYWx1R05iSkI2djJ5aFF3RkxQQTkw?=
 =?utf-8?B?aFFOT0gvM0t1VTlBVXFCNW9WYzBUU0RxQUViU3lCbGRVSys3WHNjcERJdm82?=
 =?utf-8?B?ZzVMa2djY2xoUnBJOTVvRXVvb012WEp0RDV2bEdKZTk4YlNYdm1iUFNTc282?=
 =?utf-8?B?SW9jNU9FNXpqZ3BkZ3VHa3hiZnBQRS9vZzJTcTFDUVNNbzNlN2Q2dWl2Szc3?=
 =?utf-8?B?QU9adnJJazRxcXlhNEpIKzg4QnpRclZtYUhYK3ljTTJWYXZPMHFiQVhrRnRt?=
 =?utf-8?B?QUY5VGlPU1pGQlhBN1Q0RHQ0VTdWUkhaNWJQTkRBbVhlUmFNV2tIU1k4M3o0?=
 =?utf-8?B?MGVHb2paTlp2YzY3b25HUTVHOTZoQWo0ZkJKRE5reVBobmRGTG9PZ1pXamd3?=
 =?utf-8?B?c2xMbktscEFsRnJha09URThRN2pvVXFhM3N5SVZwNFNQZ0hYbW9UdzB1OTBa?=
 =?utf-8?B?aEdieXNJd1gzM0tmL0xRWWZCeUxRejNGQklMWUl4UUVmZ2txZ1NPTkhaaFMv?=
 =?utf-8?B?MmxmZ3lEZGxtVGRyaURTUXR3UkhsZUdLK2JORmFJazF4YlR0MDhZSUJwQ3lt?=
 =?utf-8?B?T3J3clZBRFZ6V0JDMFp4b3lwNEtieWUxdHhMd0lQZ1JPUlY1NGx4YXZOUnlD?=
 =?utf-8?B?MGFRbWVDUFU1SmZSVGkzUm1icTYwMDI2LytKOWtsYUZwbGR1eDdOdWZyaWNq?=
 =?utf-8?B?cklpT2EyYzE0Y0l3T3l1N3FQeko3UTBpTVlMRFVNTlowNW5oU0pQRFcvTWFr?=
 =?utf-8?B?Y3M1OHdzMlZEd2RkZG81NkErdFpja25uR2NGSEZsYkxmYUJ1cHpPTmhxWFBG?=
 =?utf-8?B?RStZV2RWclBNS0I3RnBxK1MydFZvVGwxRW4vcDVZeFEyYkIvSzY0YTFGQndB?=
 =?utf-8?B?UmljVTk4OWJrb2dzT1hSQTByMXVrRkFwUFlCZi8zVGVLL2RPNUliTUxtQlVn?=
 =?utf-8?B?aUl6ZUVhUEtwODZvRklqOXcralcycGlsOEtZVEZ4UEhLcjdySmo1Wjcxa3hO?=
 =?utf-8?B?OExWUzQ0RE9ad2E1OUo5RHA0Rm9wdGY4NTFqNmVqaXMxN2dINi83bUg4UkRy?=
 =?utf-8?B?WThxV0trV1VzQVlId1h5WEM4bDVwbzVzN0tkZmtJSXMyLy9rRFVyVFMxZ2F6?=
 =?utf-8?B?QXYzZWd5MEx0L1k2SVFwRTIvVlRCeERycS90TzY0Q09LL2lkdm9JUzEvR1U3?=
 =?utf-8?B?L0hJZjdwMUZLdGY4TFlXbTF1QXN3Z2xGTnR1RURBM2F5YVI3aXk4dEl5YjZx?=
 =?utf-8?B?QW1SSlFUanJGelZja2IyRi9tYXZzWmowdzduaVpLWHZJNlpYSHpXM1plMUJV?=
 =?utf-8?B?eGRXWnVvR3Y3dnU1R3JSMmh4K3NVcldSQ2dhWlJidGRUWmlFNVJNQ0RROWpZ?=
 =?utf-8?B?TkFlSHVvYk9ZR0JQcWozTmlmVEJETnVCYlZFanJWT1lQdC9Sam45NGloWWh3?=
 =?utf-8?B?SmVYZE8rSVRuRCtFVFpCSitoSE9jTWpITkVUL3NFQVVwKzFHWFZrYXBYTTNW?=
 =?utf-8?B?djhWS3EwNkhBTTdNc0N5Qm13Y2YxQXFHSlJHRW1lV1h0MkVuM0d4aHo4RHVY?=
 =?utf-8?B?dFJkQ1JMVnZhRzBCeVRhTWtYb0l0VUwrMGtwejVMQVFaL09ybnlEVWs2OWsw?=
 =?utf-8?B?L2kwZzVQNmJHNlU4RkNmYzhPbHVsMHY3S2Vya0N6bytHNTZKcy9WRVJqRXBE?=
 =?utf-8?B?cHVrQi9oeThob2RoZXdNMGVIdjlTc25vQjJQZXM1NGtLcWFaRnExcVdEUlkv?=
 =?utf-8?Q?qY7Bn/KiD10bN5utQ4Uh1o7dvhLdz2tMn98u0Kd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5aa6c1-d177-4827-9bc3-08d8c9f1bcb8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:18:56.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXCnKu+NoZLzgJh2niRI28REGytsiaIGksCkC4Lrl398eZX3lhMqO5352f2Sz5MU2W6TOsKMS9AR4U8QivLcFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Fri, Feb 05, 2021 at 05:13:22PM +0100, Jan Beulich wrote:
> On 05.02.2021 16:43, Roger Pau Monné wrote:
> > On Thu, Jan 14, 2021 at 04:04:11PM +0100, Jan Beulich wrote:
> >> The "guest" variants are intended to work with (potentially) fully guest
> >> controlled addresses, while the "unsafe" variants are not.
> > 
> > Just to clarify, both work against user addresses, but guest variants
> > need to be more careful because the guest provided address can also be
> > modified?
> > 
> > I'm trying to understand the difference between "fully guest
> > controlled" and "guest controlled".
> 
> Not exactly, not. "unsafe" means access to anything which may
> fault, guest controlled or not. do_invalid_op()'s reading of
> the insn stream is a good example - the faulting insn there
> isn't guest controlled at all, but we still want to be careful
> when trying to read these bytes, as we don't want to fully
> trust %rip there.

Would it make sense to threat everything as 'guest' accesses for the
sake of not having this difference?

I think having two accessors it's likely to cause confusion and could
possibly lead to the wrong one being used in unexpected contexts. Does
it add a too big performance penalty to always use the most
restrictive one?

Thanks, Roger.

