Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D168393EC9
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 10:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133842.249319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmXtg-0005vM-4T; Fri, 28 May 2021 08:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133842.249319; Fri, 28 May 2021 08:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmXtg-0005tL-0X; Fri, 28 May 2021 08:31:12 +0000
Received: by outflank-mailman (input) for mailman id 133842;
 Fri, 28 May 2021 08:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WKFi=KX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmXte-0005tF-Sc
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 08:31:11 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10ffbe53-448e-4aee-a3a5-b308e4a7e72e;
 Fri, 28 May 2021 08:31:08 +0000 (UTC)
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
X-Inumbo-ID: 10ffbe53-448e-4aee-a3a5-b308e4a7e72e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622190668;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=VASdSap5MshOa2kPMnw39inUZ6CqQQNx0VkaoKgoeuQ=;
  b=VYW4asmStOwi7qj6e0MfDbh89Fxr6L9vwk8Cp+YypU4YhGJmUjdSyRAb
   eq/sWNYBgB+4lR+FAk0g5kOsVQedNnfD7H1RQs7/8fT786XqluQ2nq9rn
   bi47LGHgHgGP6omqOowkJ+G3wyFvOQ7UXOtmaekBAxSiMxFDyCF4hoLdl
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UgEGSQDnKTCTBJhc3+RL1/5OZu/zdS7Pc8M6VMcb05oRY56GXZnz2AMpgrnZ91jJj62qpp89dt
 7tlzDQfU8TAhiMfQ/Mi/o+bB+3DfapszNLMY5VrCCmoOeqoCL6jEKQZ+ygeqqFQ0NF/+/oO9Fp
 BVRuD4EVy4Ri9KmjMOTEuuwjHWvCtRGNDcmdJlQ2UVKqAf4VbLSNzixOv1jDlMdCqSbN3Xvhws
 ghT0Pph2rh9QnqPR3I/v4w4JPsDu0InixTv4MSLhy44s3OY4Wl0ZLZOLrNXqILqhnRaspLeaHJ
 1rY=
X-SBRS: 5.1
X-MesageID: 45209600
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ek+iyqnb1UJjE1ykT2rSfm6zG+/pDfPXimdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtjwfZoYz+8B3WEQVY3SJTUOy1HYXL2KjLGSgwEIfheUh4xgPM
 hbAtVD4bHLfD9HZIPBkXeF+rUbsZq6GcKT9JvjJh5WJGkBBs8QinYcNuuCKCJLrUt9dOUE/f
 Knl456TlGbCAwqh7GAdwM4tp/41qb2ffzdEHg7Li9ixSy25AnYrYISJyLomSv2Hgk/m4vLPg
 D+4kLEDvHIiZ2G4y6Z81WWw4VdmdPnxNcGLteLkNIpJjLljRvtTJh9WpWZ1QpF892H2RIPqp
 3hsh0gN8N85zf6ZWeuuybg3AHmzXIH92Li81mFmnHuyPaJFA7SM/Ax176xTyGptXbI/esMj5
 6j5ljp66a/2CmwzRgU5LDzJlxXfwSP0DhSxNL6SRRkIM0jgfRq3P8iFXhuYeE99PiT0vF/LA
 AnNrCv2B93SyLDU5mLhBg1/DRbNk5DUStvfCA5y4eoO88/pgE086Jf/r1Dop4KzuN9d3Bg3Z
 WNDk1YrsAFciZNV9MLOA4oe7r/NoXie2O5DF6v
X-IronPort-AV: E=Sophos;i="5.83,229,1616472000"; 
   d="scan'208";a="45209600"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOMHDnXVMujszFhUsckOL6aeH6aNaDFunT75TvsnszVHEeJandrsn2yJ1r9Nn0k59mtljh7WYXxshUsCNa5hqEvEUTMIQPBtkLukAGQ0F0qY1dOadeOl5to1TN/5nOy4aarum0qsjm0pnF/KXboXpLKbAqID6ImE0JrmH7Sh9ipaxXDkwPYkN2ha16sVHEkT1ztTz9XK0ukevalqpCwkdW1RD/HmmXx/AwMxRcXPBarwYyZrCTPAenPqYsALDUeKVv5oIpBdqHEIvLusBKB1/obO30MJjaJ58I0akC/M/AQNLIM/eu8zOhV4qtmKasulPF1eKLqZagX90/IJULsAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zRKekr4dj4xhs0PEWnqIXTmpu6fWZgo0v5jM1EFdXo=;
 b=Ym+ryaiuywXgCvQUaTQKQT3GBoSQlbym1hbPbcCzDoW6vlVKmWF5XCtIJ/t+sztAUM4oI2bt1q/sGdBSol77oxc0CNVdL8x65Xy3RtbuxZcQIrUtLyR3LcJ4BxP2woRNzLAdf4vragQ/KU/Te+BD90u1TscYrXV+R4MIlEX//wziXfyNFFBuzS/r4Fv7w2nYFxWixDlCOCNuDwNN4jxVwndDARu7/AB7kv5/W0Dc/9nB0s6TEzFBdpY+QqK3rlgA3eIwnpxRUvTx0RM2iXVjx3PRmjCz/h8HLVrnUvMEK9yeEyv9VWCj9yWX64AI1HSBgxOkOdpGWwhyU3uYw3Vx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zRKekr4dj4xhs0PEWnqIXTmpu6fWZgo0v5jM1EFdXo=;
 b=wwlYwhoGy79hnS09n7/ux1RxdkMXsiFNozN2bIy/5Z9RnRH50U/734ekeTbVhL/yJ6tszsZa2/VWPlG3DKhk3TLS8h42x8+9Kql7+LR4/+EOjyhV2mJGYmhnAVud70M+RWNRKL+A7aZ7X7G68Z4zPz69exGUutUTaz0q6o7J3+o=
Date: Fri, 28 May 2021 10:30:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
Message-ID: <YLCqQz9xS4HEpabG@Air-de-Roger>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
 <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
X-ClientProxiedBy: MRXP264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75d232ff-af1e-4e66-5227-08d921b2eecd
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB34819DE135A459A56C30C5688F229@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yEHF3Fn4kzQc79muLUFRudt1PpKGzxITV7DNdZdM1EWUKqCJGMS9cI1SHnY9foTQTj9Kj9HYseb3CDMTnTumMrcuTJWkGv7CfqkbAC+24y69YHKTaZjACcZNjCBtZU++Cphi/SdGh1aqRa+ppl+0a7oyTbrkSVqehEEXacuW9GUdVc2NtIlv+aVQd9RhTSDnq4V5pekkcDOzl2EU9sqQWx5dhSot3D4lo1ngqaTWTIeufSpz9dEgKl9Q8If7airLRROpaY411oG/wZ1EH87StS1z3EYkbxkta63QwL0B7J1mKujr/YxC9uGxtoBEJlql436MfTXPZ87sJp44a69905FFFeGTg6WLakJNiAjN/3frIV3v4Neu/em+Um1oHbbeAbhHJZlSx3oCZWv86nnbJ5t/zn1+cWtD+UOkk8udWUjD4qGac+XDzmuWb7a5LMn3Hu/zJZM2+5SUWKE6Sc9aDS+Fzo3Bix8j7NPBEEoGZCPNdg0y+oDDO3FP14NiqJMTMw+/zThMHyuWybNwXPtcwLF99PNJSbQWDI3Evj0PvcVR6uvxrn4NAcFlJlNXGqo9dCVS2MYhTYy3fZunGB/jz72W0l8xf1Awe8JwzvTPsXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(346002)(39850400004)(366004)(396003)(16526019)(186003)(6496006)(8676002)(53546011)(83380400001)(26005)(6666004)(66556008)(66476007)(66946007)(38100700002)(86362001)(5660300002)(6916009)(316002)(85182001)(956004)(4326008)(6486002)(9686003)(33716001)(2906002)(8936002)(54906003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aXhDNmdnUHNYd0x4QXp2cEI5UHpLSGx6MEsxbEF3K0RXV3M3RVVKYk5DSllz?=
 =?utf-8?B?VnEvRGd4alBLbkRtYjFOSFJNM1U4am1XNEFZVXJHNGFZMTYrdVZjdnYrc0s0?=
 =?utf-8?B?MmU0MjUvMHRIU1R5ekVseVZLaXVPZHNOcVhNY0FvUi9GUDlVcUF4WlJGZDUr?=
 =?utf-8?B?RTJwbjdUc3Vuai9XT3IvM3hISHlmL1NUMnJJYVp2SHVad2FpeEthSVkrZTF3?=
 =?utf-8?B?TldqcnUrQlJMcFk0VGYxbGxtaWV0dmVvbFVOOUF0RWVmMy9zc3RFbVZHYURo?=
 =?utf-8?B?akk3aXdTNjEwcmViWWlGZFh6NnprcVc4bkV5bHFlUVh4QUQvUGFEWWRGblBu?=
 =?utf-8?B?V0RMSHdRL2NZMDdDVzNvVnNxRTdmbnlrSm80M3NPSThUMk8wS2RsbEcxWTBq?=
 =?utf-8?B?eE9zbmg5QXQ1NzkwMWNydi9wWnBJR1puU1pVbG9iL3JvUVF5dWhER3hKcDNu?=
 =?utf-8?B?d0NXRlpTb3ZMU2RuVEhMK1BVQ1hFWGJaZjdNUU1PNjFWNWQ2QklxNlg0bGtK?=
 =?utf-8?B?aTJvWDlXMXJGL1VyYnpybGdpQlNJQms2cUFHeDQ2OE5tQkxuWFg3UUtFSkVD?=
 =?utf-8?B?TXgwUENjNkE4NzBiZmgwVlF0bDBVNXhzRE5kTEdKTHRESTNWbW01eE8vWEx6?=
 =?utf-8?B?a085K2QrK2JqVktSZzhvMlRQNDZENGFpVEVDR2tJREtFdlpKRUxuTW9Ha2ND?=
 =?utf-8?B?ZDJXR1kwU1Rva2l2emRvNmcrYW85QTA0S3FsaWpIeFRXcmU1a0IvNkZLdllD?=
 =?utf-8?B?TnVJcTl4U2RYUDJIUWFVdlFwRHRVRS9mSVNGOFU5VDRIeXpBUXBXNHVQb1Ns?=
 =?utf-8?B?eWFNc0FJZ01zYk9pWHlPdVZoSUVzT0xzTFRBSkhDYTlwV0J5QURtUVMybGRT?=
 =?utf-8?B?LzZ3VG9KT2xNTlhCajJSRHMvSXU3K0l1YmZ6ajNWdUZEcFEraHdZaVlmd0Ru?=
 =?utf-8?B?MEJIS2hycjBWVzUrWndjMUs2SFMxUWptR3VvdU9Xd3dBN2o0S2dxRTZkYTls?=
 =?utf-8?B?dGpDRkhoKzhwWFlWRHRBaGxDblh1blNhVmthZDFjRkVCNHgzK0xJSlpVY01Y?=
 =?utf-8?B?KzZQNmI4bjZsQXlnWEw3UExTSTZacXdlUHNJQ2Z1ZHptQWRaa0xXZ1pCcSsv?=
 =?utf-8?B?aVU1bU9oRFVGYUdVTjNpK1Y0ZjEwTXJ6U3NMRllNTTN6WGhCUkliemtxaHBQ?=
 =?utf-8?B?b3ZMUU1WT2Zja3BZdmlsQVQvbnRjY0VFUzVza2FuZzM2R0wvSDR5SXo2bjYx?=
 =?utf-8?B?WVY5Z3F4NHRXTXp1Sk5KZGRtdGk4TXRjOE10Z3F5S2Y5eGdqRzk1dTlwQmdI?=
 =?utf-8?B?WE43aGVjMklWS281TW5YU2JtdTFXWSt6V2cvY3kzZjUwV051QXl1bGEwUG5L?=
 =?utf-8?B?Sy95MVFvOWV2bEV6VTNicFF4dzdLWmdGZFJ0YmVVL1Jjc3MzWTVPWEhBREZy?=
 =?utf-8?B?ZVZQd2p5Y0YxWjNjNEZmVGtSb2lsQ1M4TzhIdlNiRjBnWG1hMDZGY0J2R21x?=
 =?utf-8?B?TkZLY2swSDhjVTVUcUpwbHJIdk14TnJrdXVQTzhIeGlTV20xYkExUFN1ZU9k?=
 =?utf-8?B?ckhJaDFWUkhGcWlNbU8rZjJMVlVTeDI0dko1WEswQkNodVNxK1NXTzhBYmZo?=
 =?utf-8?B?UCtnTzNvSnVjZWdRUHZQeHdKVGtIKzJHa3h6SlY1UW5vVlVMN1FRUThmMWFX?=
 =?utf-8?B?ZWpUSGpBQWtGVUdRbm1tR1lkUmlxcnUrbHlkQ0kxVnJBVjJJU2wyd3Iwcnd3?=
 =?utf-8?Q?YHcydeAORn9/qGHBTr9wpnNrfZFCPJi7GMlP6NL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d232ff-af1e-4e66-5227-08d921b2eecd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 08:31:04.5886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izIRkhGBj3SbNTQnXmBWjKwArTxzls/MQ9+6Xw4MC23/oyn9hXP7Ui3tYDiRGtAv98qcCrcTsOCglY9p2eTcow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

On Thu, May 27, 2021 at 07:48:41PM +0100, Julien Grall wrote:
> Hi Jan,
> 
> On 27/05/2021 12:28, Jan Beulich wrote:
> > port_is_valid() and evtchn_from_port() are fine to use without holding
> > any locks. Accordingly acquire the per-domain lock slightly later in
> > evtchn_close() and evtchn_bind_vcpu().
> 
> So I agree that port_is_valid() and evtchn_from_port() are fine to use
> without holding any locks in evtchn_bind_vcpu(). However, this is misleading
> to say there is no problem with evtchn_close().
> 
> evtchn_close() can be called with current != d and therefore, there is a

The only instances evtchn_close is called with current != d and the
domain could be unpaused is in free_xen_event_channel AFAICT.

> risk that port_is_valid() may be valid and then invalid because
> d->valid_evtchns is decremented in evtchn_destroy().

Hm, I guess you could indeed have parallel calls to
free_xen_event_channel and evtchn_destroy in a way that
free_xen_event_channel could race with valid_evtchns getting
decreased?

All callers of free_xen_event_channel are internal to the hypervisor,
so maybe with proper ordering of the operations this could be avoided,
albeit it's not easy to assert.

> Thankfully the memory is still there. So the current code is okayish and I
> could reluctantly accept this behavior to be spread. However, I don't think
> this should be left uncommented in both the code (maybe on top of
> port_is_valid()?) and the commit message.

Indeed, I think we need some expansion of the comment in port_is_valid
to clarify all this. I'm not sure I understand it properly myself when
it's fine to use port_is_valid without holding the per domain event
lock.

evtchn_close shouldn't be a very common operation anyway, so it
holding the per domain lock a bit longer doesn't seem that critical to
me anyway.

Thanks, Roger.

