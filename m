Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3473EF0DE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 19:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167993.306714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG2qh-0005cL-Rr; Tue, 17 Aug 2021 17:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167993.306714; Tue, 17 Aug 2021 17:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG2qh-0005aX-Oi; Tue, 17 Aug 2021 17:26:03 +0000
Received: by outflank-mailman (input) for mailman id 167993;
 Tue, 17 Aug 2021 17:26:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mG2qf-0005aL-RF
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 17:26:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3064814a-ff80-11eb-a4ef-12813bfff9fa;
 Tue, 17 Aug 2021 17:26:00 +0000 (UTC)
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
X-Inumbo-ID: 3064814a-ff80-11eb-a4ef-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629221160;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Zej/fV4HnCgJlVnWLioSvkq17kWekkKf+ab846x5C2I=;
  b=IV3dobTfppgLCO9teGbaSQI2p0X/Kf4PLMy5SzRI8LK7eqgky+X7+2pg
   2BWcNQ0r2ckJfaiQ8GFcGIozksnUnklOQDHuBorkjT6DodFMZLkNG33nK
   m2qQk/vX6RRdFLRG5RiI02lNvj6zDOhhsyLTYxo+0qj4NCdrjHopbjQSr
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VWUBFo2Ag6XFIldcyF2LChYs5B4VqeHQkGTCUMtKW3Uqj9sNy6i4T/K156ypWd0eCbSRlSSHob
 pxnohSPJv41AjNFOi1yaDLf+nGbv0IwuOv9AXTspmC3R/Nx3k/GQkoykS+urnFKUWgVhXdihcF
 G/BAnVIClcV79T6M3R1PYC317YuUv7bkiBUjBwkPQVzkbBCBMxhQpfecN8eWKaZtTXa+2quDS+
 3FLvDilSlV5WM9uLHRpof6KTS1fT1V8A1YGrnTCAa0M3iqpNGB4o0mvtQZKEzYLay1xGhgrIt7
 QSdTI3JroumPJAmE3DwiLFsR
X-SBRS: 5.1
X-MesageID: 50685926
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xFEi46OA+j842sBcT0/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY99s2jU0dKj2CA5sQnjuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzY4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 fxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72yeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlNXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbVrmGuhHjTkV1RUsZuRtixZJGbBfqFCgL3U79FupgE986NCr/Zvx0vpnfkGOup5D+
 etCNUiqFgBdL5PUUrRbN1xN/dfMVa9NS4kBljiaWgPJJt3Tk4llKSHl4ndxNvaNaDgn6FC1K
 gobjtjxCcPkgTVeJaz4KE=
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; 
   d="scan'208";a="50685926"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLrd8SME5hLjsoZNuGyX6NkoWujCs6g44CHMpzPiM87tlaIO6ViQm+HgYRJpncZaPwt2qL2gnbpPfOzHP2W5kBSxbtdTM1eAbfpxZZ57HRmYcsXLADc2ZZNdse10Bz/cTqW+JLPY6h2onthNn+ES7UJZ8mmHgO5CCt1UuXWlwX/m/M1UgQR3foUN8Lf1abqi2wI58/fs648bk1RhmI/8zZ6KA/tiFI8AYUiBfQf8Fk98BQCwKRpaacdVQSkLnAAVUwhrCpZ6E/nMeAhxNKb8dZ/VMMSPKgPUAN0Ri9XGqeGhr6g8riBdRcWEHl3/aOHBWMMSssEaYjLyGeNESKUtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zej/fV4HnCgJlVnWLioSvkq17kWekkKf+ab846x5C2I=;
 b=CcE/QOlWyZ2U4x54eyL6P1RfMStJ7O77FXjMv/0XmmEyjlXerDITYmCFkdEgOzIDGz/nwJiPdAkVecNAcj++8bEGjtmuSVBO0ci1/wGhUsIckH/qvoDEJgVhlzOhch7zVJEd2Xdd+++bkaVGNlm1VGaDEjorXXl7h3ZuG5xaP6pdXb+vVZOQ79OLntLRwRsbsiFjBH22oWgRW/KESJQEaenE7XirdwWl5Zg/JLYA5S84B+KIcac/R5VjyIyElLkgoRvEktxuQnWe7V1cnVnN0Y/g/T5j76NrpqRta9fODkjaXH5bgYz9naOpbdji7TSgXU0bJPHV9KRXrudTl1wvOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zej/fV4HnCgJlVnWLioSvkq17kWekkKf+ab846x5C2I=;
 b=fcgcD/r/2P4PkA1uI0+iXyxj9ntSYLFaaN/cwkqcewZh7UNGnGyAWhBsb0YpISrCK8jTEXaKGbiyjD7TxdJo2kitdqPTgG+GgiiqpMQTcxMTfhTOxNJvhZSH1LSdhYjbNDATK7Jny4c7L0wiaw4qYip6X2XQNJJwgy3J5fmQaWg=
Subject: Re: [PATCH v2] x86/PV: assert page state in mark_pv_pt_pages_rdonly()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <929e4299-c9b3-0714-3c0a-3c3d1c0c14de@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <85333613-4425-9f27-fd0e-fe4a65e2860a@citrix.com>
Date: Tue, 17 Aug 2021 18:25:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <929e4299-c9b3-0714-3c0a-3c3d1c0c14de@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 201f3b98-eeee-467e-bf92-08d961a40810
X-MS-TrafficTypeDiagnostic: BYAPR03MB3669:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB36699EF5C2FB4F177A2072A7BAFE9@BYAPR03MB3669.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgorrM+OCeQRiAa4Aql+RJ/fCvpuJxjiKRPZ67FxUN0LIsqwH7AhnwPhmbOIbPDQbGh6XBdN3owzmX3JGE8SIn8fMjhCy5+G2St6Y/dWHzLk6s45Lgj4hY315b1oYImX24uYRcUEk5F4H0MwC/qgkupJkUj2/aYLBG7bVqAhzXct244s2gHRA85ZyCWlAfw8wO4WUrtZl3t2lg33wlBFNFNAoge4rroqYIxRyWC5tIDxTo6KVqRYLiu/XuHCIEfjZba/hG01fSwxwGsXGpLnvGfO6gzUE/iy8/o5tEWQ12B4MMPFde6vizdN5RK4srtQEKzEFLTleKw7o0qKDP4ClBjyFGGT3qFWiNdLapkirRq2EmRYqgAPkERGc0b1SqFLyo7ro20OSuH16Gb57yiXRXmN/6ZTj0ZG9Keb3wSmHbiJZZz3UlmC78I1zQVFzfYnPzej59rDlzKj7fkCs4AQ2PQmOiCmx6yeJZIL60DAoLyzzbJcEPCGFIOL4Y2QmPQnhjdiZ9s281ZNd1GzaDkerQ8hscp+oWfsBlcUkkjMI4x1CUgpS1eFdrnmENcGwlC3PJTO5zke8RNjH8kVb5WlVLIVsRvF4qxSprqHqaSwNpaN+2ojgT3qkAGComxzrtozI0iF3PpRJQHa+2Du7FHg/kH4l8yxUKpziK1ZSpAVzXYLz4Y531ZRLkliRGuOYCH7y4mthOSy1WEdS3M3RPtLJswR7YwaYwLH3k9fBRKnvr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(4744005)(83380400001)(956004)(86362001)(16576012)(36756003)(4326008)(8676002)(8936002)(31686004)(31696002)(107886003)(2616005)(110136005)(54906003)(38100700002)(316002)(2906002)(66476007)(5660300002)(478600001)(66556008)(66946007)(6486002)(53546011)(26005)(6666004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHQ4MmhwZFNFTmdoakxlTC9IbEwwVXkwb2UzZ01CY003UGk4QXpIdTBSVFZ1?=
 =?utf-8?B?Um9xZTdZNHA0OEdlMk5tN0x1MU10cXU0cDFoaVhTZldrTUE2WDkwSUVwVm5n?=
 =?utf-8?B?RzNKS1E1VzBaTnhWdStCMnNmMlRVOW9zS0xQdWRKTWozYlJlSHBlaEwrWWh4?=
 =?utf-8?B?UFZSdHBkMCt3bHFGa3ZxOVZSWThsRFlBSFVIa05tYVRQbG5tcDhUZlJrUXp2?=
 =?utf-8?B?dUNGMGFDVVJlUFNoeENETS94STY4TWdVWXNJc1FxZHBQOHI2UTJHbElTUVBF?=
 =?utf-8?B?UUNhY1JaLy9WcVRTWURJLzE0Z1BNajl2R1RNSVU4d2Jtd2QvRHh3TzN1TVEx?=
 =?utf-8?B?NWNxZ0N6UnRPSUxCNlZVWVJsQ1RSYU1EbU9CSTU4OU1tVGgxaENQMC9LTCtO?=
 =?utf-8?B?TzYvcDFEK0tnSGVXdFhSTWxTblB4VUd3L25QODc2MEpxejlQSHlyQkdSbUda?=
 =?utf-8?B?WHNsV0QxK0xvdGFqc3A2c0pKeVlHMWN5WmNNYTZqRkV5NGZWNDNCSTllSFJh?=
 =?utf-8?B?VHJWV3F6azhzdldtbTlvcGcramxWazRBRTlqUzNWUkF3a3hraHAxKzRHS1hN?=
 =?utf-8?B?VFVhcUF3UlIyQlIyMi9MSGVEQlIrakZkdHNOQ2htMkJXVnZVcDdwVEZCUGZz?=
 =?utf-8?B?RTZCQVB4ek5RVkZTaVZST1MrZmx0NFZCM0dWTzczYng5MVZyNHpPcGQ1d1BB?=
 =?utf-8?B?K3doQkxNam9tNHRJNGFuNm1jc0J6eUx2cEhaSXQwZTRPRDdjKzcrQm84dkJk?=
 =?utf-8?B?ZWV6YU9ySWl2dkdvWFErdklRZDFTTG51S1ZpS2wvWE00ZzF5QjZudW1idGd1?=
 =?utf-8?B?Y052T1FuYXNzVzl3aEo0MytyNkhSZG9GNEJSZzRpVjJwR3l1Q01MaWZoUWFm?=
 =?utf-8?B?MmIydWZFRU9lajhwbEIwdXk3Rm40OFdwZ0JGV1RjLy90TjNLSWM3TnpsNVhU?=
 =?utf-8?B?TUZvWnZzRlllQlZLVjFLSTdZSDBSVm04QVlVRjE5TXByM29UTDJTU0pSeDFB?=
 =?utf-8?B?MlU3NlVtb3czcnUvK3c0Z0I1Y1ZHaGExUll2VDNaQlFJNUo3dkZhaTN3UTdk?=
 =?utf-8?B?OVZqQXYwRlp6WUg0eis3WENBTndWcTFNeFFSZFlBYWpydVhMSkF4VnE3Ny9V?=
 =?utf-8?B?cTh2NU1janpQMzJ2SEU0dU1YUkFNZ2p6UnI3S1hwMWx3dkZyRm5YelZDMHRz?=
 =?utf-8?B?SmNpaVRYUjdKazcwQk81Ynl2TWdnUkFXSDZFelkrSU9ralRDeGd5Q1RpeHhQ?=
 =?utf-8?B?Rit2RTQ3M28zRmpPT3FrRHM1bHhNRVE2Z004TURvNUxmUXkvOUhwL2oxWklD?=
 =?utf-8?B?MnZBSHRORmJJVkFxWjBINVllN09mY3M0aTM2dmlIZkhwQVBoZzFSdlJRcXht?=
 =?utf-8?B?d2JBZndPSlRXNGJJc2d6Q2VKTGVPYWt4RTFEQU9WYldKaUUvZC9wR2FxKzYw?=
 =?utf-8?B?RHNmVThMM1krYVdEcUVjK1plU2x0TE9uc2owRGJVNmF4RlhUREowOTZSSUw1?=
 =?utf-8?B?aEh1enM3bUR2dDhLNHYvUVJZQW5DNzVLR3NnNmpLcjJyM015MHcyRFd4ZVlh?=
 =?utf-8?B?VmNMRDFPVjJ6WHFTK0hRZllBdTZlbWg2YWxIZE9FUlUyOFhtTUFyc3NOWFZv?=
 =?utf-8?B?WnJuWUZYYy9JVUVXOHJtQ0xCKzdqMk4rUTlDSEpOQ09PZnRwbHFyblFvLzJ5?=
 =?utf-8?B?OU9JMlJKK3JvT01SazVob2pEZW02ZnlIVEQ2V1FLS01najlKeU9ZeXlpOXg1?=
 =?utf-8?Q?yAnBT/vdpZ5Dv8UbVtwJKO6W5DJBexfi5u/KFQ7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 201f3b98-eeee-467e-bf92-08d961a40810
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 17:25:38.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyI2NZY1Y03AfMAZbLhuYOLcwCAWSRDwe4r4Hkcr7C4i+HkdYME0k+8+I1j35/IzLDmDex1EkBsnLZkvricWG7GtuzD4mS6FT/lfPbu3mzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3669
X-OriginatorOrg: citrix.com

On 17/08/2021 15:29, Jan Beulich wrote:
> About every time I look at dom0_construct_pv()'s "calculation" of
> nr_pt_pages I question (myself) whether the result is precise or merely
> an upper bound. I think it is meant to be precise, but I think we would
> be better off having some checking in place. Hence add ASSERT()s to
> verify that
> - all pages have a valid L1...Ln (currently L4) page table type and
> - no other bits are set, in particular the type refcount is still zero.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citirx.com>, thanks.

Are you planning further cleanups here imminently?  If not, I can
probably shuffle some of the easy ROUNDUP() refactoring in the direction
of an intern or grad.

~Andrew

