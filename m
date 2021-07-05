Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025973BBAD4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 12:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150056.277506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LVL-0004NN-O4; Mon, 05 Jul 2021 10:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150056.277506; Mon, 05 Jul 2021 10:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LVL-0004LT-KV; Mon, 05 Jul 2021 10:07:07 +0000
Received: by outflank-mailman (input) for mailman id 150056;
 Mon, 05 Jul 2021 10:07:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1m0LVJ-0004LN-Ho
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 10:07:05 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 705301ed-8c48-4a0a-a951-f2d9a3fa495c;
 Mon, 05 Jul 2021 10:07:04 +0000 (UTC)
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
X-Inumbo-ID: 705301ed-8c48-4a0a-a951-f2d9a3fa495c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625479624;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vD5+6S7g5mH2XywkXQZuyOwCvE48NX2okNQE1cctsxY=;
  b=MfMPhytjXFMtLi4waMEl9jDLBzzSsvy4rEZCjQW+VshHZvl5Pu1Kb6S2
   Mqr/URNF6mk4kf1vFZgKb2Jhu3dwpe9erp45C0YLaFKU9SeZnwYuBOQ2O
   TVSF5VJKra2OLKd+hCXmHDC2OecP+K3fuJTw8RrP5H+pylUnwTZVofSKq
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g3eDuLWzwRcBNxi8TYNY6KahRQEBanD0AS+5+eBBGCHOGQic7EK4fEZyLj87huJmfyXyea/YkM
 NSN9UGOE4PM1XYA2RA3xKjDdavGJh5DEu6Ik/e/Fz+fgwjPN7nlAj6kdiDIx6G2cc83NVQKEv8
 eFTZr29TnOVHVDj3UUDq2whDSR/BS6gPzi2Pj/XYEcF2qimzzLHcUN0UZu19cSZb5aY3xXU8RG
 c70a5pSYK+5o3fWIjTqgMq663kDSRtCCtW4ssIivaVNLyAKOIck5RCCpMTxOlU0orFZ2Cl0J4T
 I3g=
X-SBRS: 5.1
X-MesageID: 47572914
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LxCkrKCfSlmUAYflHehBsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6LS90dq7MA3hHPlOkPYs1NaZLXXbUQ6TTb2KgrGSuAEIdxeOkNK1kJ
 0QDpSWa+eAf2SS7/yKmDVQeuxIqLLsndHK9IWuu0uFDzsaDJ2Ihz0JeTpzeXcGPTWua6BJca
 Z0qvA33QZJLh8sH7SG7zQ+Lqf+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lkdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxx75xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjzEC3abFuLIO5kLZvu3+8SPw7bWTHAcEcYa
 lT5fjnlbNrmQjwVQGBgoEHq+bcK0jaHX+9MwI/U4KuomBrdUtCvj0lLfok7zw9HaIGOu55Dt
 v/Q+1VfZF1P4IrhPFGdas8qfXeMB2EffuaChPiHb2gLtBdB07w
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47572914"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjjFveKX+f3OQGdrqQKJPq5ANq1vAO9ZqDf7/aOcR9ylhprbfPGny6YyNwtT8yVLB+6mteKeRRNDzqJ2rtgWFahuHlVzeedpfQm3iOtTDJmgSrwdPQn+k5/DrSk5QvWH7vzWCUdS5j6wEX0gtSWvExRvSzixf0O0fQXrA+zASxl8E4Ft9IczQHWO1uEvY8X/asTsqYl788Xlx6lvN6I7zpk2lux1Fn+W8ffuE4l3SdYzBQK7dvfh82icC/ZBWuDt6LrEf77+knR1AdoWL+4P+EJ0l0tCVGrZzxj7K7QZEJx4acsIN4drh9Kae9RpAuIbqHenLUYci9KbizE8ZqnRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD5+6S7g5mH2XywkXQZuyOwCvE48NX2okNQE1cctsxY=;
 b=nQbkuhtZLY2Uml1lpk5XXdquih3JSRajkG5OS0KLJD+Jfp0aqyArzYHztjsW5YxVRLM4uGtDtqzBbaOntKseHIEq5dadhU4mT7j1h5RyRNcyzfHXWzFG7XevL2rLmA8zwppvaHf+jFyhxUjLYwAeNPnPZNZl0Xmd0DjDpr5wQoq/x6FQk0sdDW0MIyGwRpNX+JEB/Aeo5CWLUxDSpfi6q3lD6CE2wGwLsF7wdqjlIhQoTr4pCFMxtii0oOmUA2mmFQj+K6XoqpJ04TScYmZz3H1YWz/o+gIS2DmuTPCYuGzwFRMO9LC17i/9ayIIZNx5cEed3Kau6vUPjbAEPcqDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD5+6S7g5mH2XywkXQZuyOwCvE48NX2okNQE1cctsxY=;
 b=m386p22YELbCmRz3oesAV1oOayGwGcdvWWCQXiQ8WEVBhnmHP65bwLGNPlHWTVZ/UtG3qIZYundrLobauyATGlK1QrOT8S7T7IbN4ckv3voZZrVZy//pifQb9InAtfZG16Zc87ju+HcSQsXG5oWfW8BRrdgi+T3ZAI7DwnN8d0g=
To: Jan Beulich <jbeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
 <06968742-355f-ad37-0681-e51eea256414@suse.com>
 <20210705100228.4947ed4e.olaf@aepfle.de>
 <ed3ceecf-239f-9bd9-e040-5246c9b49f53@suse.com>
 <20210705103224.26f3835d.olaf@aepfle.de>
 <1e2a3967-06e5-75ec-3aa5-1f39b6700e63@suse.com>
 <20210705112548.22ae6d20.olaf@aepfle.de>
 <5e4986ad-d3ec-18af-b1ea-ccbce57a70ff@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
Message-ID: <f4301654-49c1-8b9a-a6c4-2b40d06641ae@citrix.com>
Date: Mon, 5 Jul 2021 11:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5e4986ad-d3ec-18af-b1ea-ccbce57a70ff@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 063d4c7c-3093-42b6-a338-08d93f9c9da8
X-MS-TrafficTypeDiagnostic: BYAPR03MB4245:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4245E033A3B7E2D4475F68C6BA1C9@BYAPR03MB4245.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgLc8G0W7P2qK0BxA8MnJA8fwIHuPTQZna+HkSajNHj7QMNSC4bGLhFUBMlQvZWjMt4JocrWScZdktsyULQ0fXJp1Exzf17a3C78FKo4NcX5/Y7j2fydX6264WAoWHEgTY3gDDI6upTGapUsrWvp+Su1DzjCkqmk/hokLkzqVSp4TZ7frFzai/IzVP3BKxSs6X/uCd4HgWchv/iksYwaiUgI7yByEq9+9rok/McSNfpmr4ZeLGy6sUEVm5GepRc4w8e+QNQDGYRya0MWP/IHWhcO2R6WRfwZkyv7yY3PYvYDWO4GNJXSyGAmrbe5FGcu2PvVmPax21xZhdZYT1mBqgLPx1jhupRW8Isd8kOJBUm0+7IldjBxWo+sb1HR/GopXts91aWDokZof5I8UjIWCX1v3o6cDatO+eLQXHugR+aTmEGtQ7DZFK9GS2nIemXrQhp38ZPQLA/Gu9H+iiAN4H6xmPLan0a1zTzUnRnlwLVlg4DZuFeuf7FU5krVRczOQFf0T3jBhuYQ2wDF0ASGYpa0Teq47du4ziXVR2rf+brzisACS92nhtYbPVJuebukR79zn5GWez+MCX3hQoLoW00dG2kdGU1EbP6RhILoMT67J6kzJeyAGNNVpRxu1d6IzB0uNMClJl4mueIURm04r1SK7PnQte/yOPASmrmmxY8RRZO+gPeoi6xcsK6ZIF9nG0NSzngMhtYLyzmlAQn7KD6WqjaaLkJsvFekGVcY5bk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(4326008)(66556008)(66476007)(478600001)(66946007)(110136005)(86362001)(6666004)(956004)(2616005)(38100700002)(316002)(16576012)(8936002)(16526019)(83380400001)(2906002)(8676002)(53546011)(31696002)(6486002)(31686004)(26005)(54906003)(36756003)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?M4ygjH277D/R5Ce4gMaomhJWmRSP/EFPW2txTVTmH2kTM6SizzTWpbf/?=
 =?Windows-1252?Q?ZzR8+Pa2Oek2eAE+cKKhNcha0u/CBbZNxRiYZUH0+rEAeFWJtmtYonFT?=
 =?Windows-1252?Q?flmpuSYPNpeA6GBySZDMlId29vGnLipIes7wpkXctlCj8beBpZZMEUk6?=
 =?Windows-1252?Q?YsvWqVlOpDPmvducZgPBriaPT31fKHHweKNR3R4iHrs8lqesiJWg8xpO?=
 =?Windows-1252?Q?HCfRhyZxtEqGxOpP3UZX1mIAv4NZHuMF4K+UJJ0iR2xgrAKFMJ5Z8+8+?=
 =?Windows-1252?Q?cXFPtzlFOGwlu1al5EypH4EZJivs7Ygj+IrlYAJsT8KB0BT/vxnxgWzb?=
 =?Windows-1252?Q?U0TMxLBVvf9RVTWqJM1LMmptq1+e+bJirogrNHH9WPEudeahKr1F+wpF?=
 =?Windows-1252?Q?LswlVxFsHJWIhrgSRcUfGN/krJoNneiKacCu+7Gjke19vDf4gXUZs/sR?=
 =?Windows-1252?Q?k8ZZ2zyQFt/JK0q4PJX/kibuLRHSWDokr77MnmxUptlbcd/ul8/hBo6O?=
 =?Windows-1252?Q?pqIVYtryTSbrstPxNlXopLASxHpfv7PYbU4sbkdwIOVSLKPE1wY45GV7?=
 =?Windows-1252?Q?zhikuobjQOaSbxLP78+6VaFzSTFW+PuUIBcCpDEE4h8av7BSLNUyF6qC?=
 =?Windows-1252?Q?ZuDW4FxNAiTWsaQEH+GOzVJIBvaEDKgl5kZFAWVhGmmuQGv54Zbc2P/h?=
 =?Windows-1252?Q?SKtSQqzhZ0fOCh13OFituGEFaBywM2PP7H/nhcmRL8YPeQ1EtxZS0YEu?=
 =?Windows-1252?Q?/wLcJJtb+kxbZiI1DrPn+Z5ZUc/h5uPOkDADyAmruLCECp9qgDgR49KA?=
 =?Windows-1252?Q?LpPfHuyxlQ9eGN4YF6om7IZXhTHMt/aQhkj6WNTkLdgJXVBBfIcB5Fcc?=
 =?Windows-1252?Q?aHhZUWDTbWnGT3afvcJyeTwGF3zUXT4ig1tJx+otaQsXjZJiLFdtDoMI?=
 =?Windows-1252?Q?Bk2Jpw2E8pAuHqrj97UkZkRL5q2GQbvwBYaZMWfBtHMfOvE8KTTcURpJ?=
 =?Windows-1252?Q?0M/0N65zlC83mbR/CEfNaztkGDLGQfp8wMaD45PxhSrigxRa/debuYNr?=
 =?Windows-1252?Q?7Kht1/FJidHFmtVCfb/vMyQvzA9sb6KrlSuPOtvt4OX0EHzGdiIf90hh?=
 =?Windows-1252?Q?K3sE1lPj5fvr+B8pqF+wwg81xnZ2DcwnUk7HhSXmPdgGPxv0f/iBjHs2?=
 =?Windows-1252?Q?pzLyODU5MY3DepBi9Cl5W+rHaTj10oQXNFMFJkPDwe4BYnU2ygcDCptt?=
 =?Windows-1252?Q?cSqruudRs1pmQ3MzuACZQlY+4j+ZHnhejYrbwCL0QJeeaNhdzfqL588g?=
 =?Windows-1252?Q?flB96SO0mYK1vLUUFLPcI8YHdU5p8EZv15W0spM70O9VIJY+jR383Ty1?=
 =?Windows-1252?Q?PSFUMwyifyprbngUa1FrrrfSu5TJOQzgyCklYFVSNqNJiUdq2xgzaWja?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 063d4c7c-3093-42b6-a338-08d93f9c9da8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 10:06:54.3327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPNq34/7jiz8T4FZimfmhBxYoLslPBKTFFWikqtYANUbmamnVAyhv43IjTr3fqXhS7XtzoeqEJXh3jH5pt43kO0GuCt2dYnNnydxt9XRJC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4245
X-OriginatorOrg: citrix.com

On 05/07/2021 10:31, Jan Beulich wrote:
> On 05.07.2021 11:25, Olaf Hering wrote:
>> Am Mon, 5 Jul 2021 11:19:59 +0200
>> schrieb Jan Beulich <jbeulich@suse.com>:
>>
>>> "The interface" being which one? The tool stack can map the guest's
>>> grant table, so it is in the position to find out about all grants
>>> without further hypervisor help.
>> The interface means the code behind verify_frames.
>>
>> If there are indeed ways to query which pages belong to grants, how woul=
d the toolstack need to do that?
> Map the grant table of the guest and walk it, recording any MFN for
> which at least one valid r/w grant exists.

That doesn't help - Its still racy with in-flight IO.=A0 Also with updates
from Xen such as the wallclocks.

The only way to fix the IO problem is to disconnect the blk/net rings
before doing the final sweep for frames, but that clobbers any ability
to restart the VM on the source side if things go wrong at the destination.

I don't have an answer at all for the vcpu info frames.

~Andrew


