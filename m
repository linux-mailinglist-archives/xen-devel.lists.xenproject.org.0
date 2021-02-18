Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB231E88F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 11:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86534.162590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCguN-0003Uu-S6; Thu, 18 Feb 2021 10:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86534.162590; Thu, 18 Feb 2021 10:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCguN-0003UV-Oi; Thu, 18 Feb 2021 10:51:43 +0000
Received: by outflank-mailman (input) for mailman id 86534;
 Thu, 18 Feb 2021 10:51:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXm/=HU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lCguM-0003UQ-64
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 10:51:42 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 468b704a-dbfd-42fb-9545-8d7d9ae2f99b;
 Thu, 18 Feb 2021 10:51:41 +0000 (UTC)
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
X-Inumbo-ID: 468b704a-dbfd-42fb-9545-8d7d9ae2f99b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613645501;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jhzsGpQPzBitDrJL2kuF1JGoA85M8mY2OIKBQ+Alj74=;
  b=bP9p2Ne+ft3iPhmRiwVRlB/pVne+bC+B8lE7wFlSrBiatxJCd9bgGM8u
   N4C9x2v0TyHvyJBGWuS0v6+xPcIbtyMz8yFaJX3VHP5u/PIw8g3M5ftjr
   SXK34NLRa5b9MNEFEkvYEp9b2pnKXNDYjVdn5poaEBP3k5xBUAEWD94az
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: L9kBf9ecP6woPCL0REzAkI9uA7tE6ccRInNTa/3BevqceSaKjzecv8X08XoV+mkxQ9yK9fFgZ2
 sa+MoFOJpEyJjAA5oMOq4lxZWmVtyAD7UpYSyrLpVP0qo8dayV6KrJysr0iKbpI82fVm6eb4iU
 OP1CzWbLVX+zmnia3kNsiX2cm4gZjVfPPnEJ90kdHMnI7/9i4na7Jz8L6ICw/B+/vRpOkcWWs2
 aerHhHmDuMrs/oMxakJcKiXiXeyQR6sNn3nYgyyiSxHLBX0RbYh3oZ7wn4vA0/VqCINk46rIvh
 has=
X-SBRS: 5.2
X-MesageID: 37870199
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,187,1610427600"; 
   d="scan'208";a="37870199"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMwBOlfRNgj6wmBgfGDFoTl5hZFTwkiQj6RVcwvNFBquCjkSUyyAK+d+4gKVYoYC7nx8iDbfgeNlTYdibXbFlxkqgVNSVJRiYXxThBXf4O00uIUKNx4DjCQqAiXd0VM48Ie+BEYz+d+jRt819sly+cAe+sixAHSkz2nl4fp2hXzShLoWBHRV/jBq28XJ1yHC4sbogvJEkgFqxUzDflvajc+MFKslZAcLj0xJl8ltvrY96+h8lZFzMnEkhddO+vHpItsre+HURQQTjNTGYTDI0ohtgRWCq/8zLaeef+3yfZwakSVIaOlToSekiAqPJqvYcqFDwvI31uy7cOz22eB4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhzsGpQPzBitDrJL2kuF1JGoA85M8mY2OIKBQ+Alj74=;
 b=JhBv/otPTaFNPPoBlGaP1R7nvq9qx/v8zDXM4HRBaNhRRwYF4goqmQRnMGBorb0diLMHYZ7nNl3vNI6oNsRZnCS9H86S/8E8AF3Q7nMUhBGqq8Lu4FL+7hHCKx6TydmyiN54glIM2ziRc+IKwFHRiS5p+lJ7dr/9M7bMCl4/fUslNb5wjZL/xPAolQcNOgsIYd3DwrlqBzYohzjOaw2c/44UMwrTaDkYWn3E9ccOwJsRywFL5uoPlcPEYNLfidpEdqJHcnzQdMOH14neC/pqYQTxgqfGyRQdFLqzOYIyE7czk5TIGgw2/CH1kbhi+WfMsBaiEWShb0XFv1ft8Ap/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhzsGpQPzBitDrJL2kuF1JGoA85M8mY2OIKBQ+Alj74=;
 b=DsTzd+Wg70kAAg6zYDLAyfOnnJtepgHgBSEQ6PcRyU8jr4nHgAWGpoZumaTrTFzwbGnlGxnVrGMSirGj5PSQt8VY9wENxtojolj4m+Yi+u2m6H2OJ9lPG0xf3Pfr9dpXXE4kfuqmi66V1YKMyDsqhAfrEVMO5DbPH35CEckodXQ=
Date: Thu, 18 Feb 2021 11:51:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
Message-ID: <YC5GrgqwsR/eBwpy@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
X-ClientProxiedBy: PR3PR09CA0007.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea04b627-bd38-4914-8620-08d8d3fb2a09
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3147E970EB1BD72E5DDC80F68F859@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DO2LOadmTtJDr1qNX3aqhQIcZ/DeEgzQwlJu1m1RolmHw4ZNyN2PlWCEW74hiHB6n7vROdAV2WlSU+9vXP5GsfuGbS4IYccgUjwfQ4niFt/mvXLvPW9ib927OFlvsisrXmuj4+5/igqWC2quzpDlPy+GpfVftspAqS+tA220yJrXKpPb7ZpQMQlPB9bKSL/e0yhkt/uy3bt3frnTgSrL4maNTneeGvqykWxiyK+/nCpahP1TFI3pmiuWmgH14hBbW5yfEiwJu4DbuaCYC5csGc3+VxFopsw4Fskaj2Pt45LcqHmzdM9N5d+2R47FhYHje9bNp+AGORXGczT4xOGwGLwmhHW7uLH29KDu8KVx/54C9+4AX63Eu+bthBBEYwGX9Y6YnoSTkrIlawXhqCU5R0istyKJ/fGqS8LLD/A9XpLENiT57c9bOIUJ5DUhbkygPU+A9Za6Ad5DWWoIr1N1KL3TL8TpLBeNHgSb7FM05XXKrE5P1HMomK04N/ij4/Fz9mfb94uuKft2SzHc70Jchg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(376002)(346002)(366004)(39860400002)(136003)(85182001)(9686003)(956004)(186003)(66556008)(33716001)(478600001)(8676002)(86362001)(4326008)(26005)(4744005)(66476007)(83380400001)(6916009)(316002)(8936002)(6666004)(16526019)(6486002)(5660300002)(2906002)(66946007)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0VUeEhSUDlJSkRDUktTcGYxSjlHUVN1czBqQmpvbHNLVVMrY3p6bGZWQkpq?=
 =?utf-8?B?M05RbzRqaEtqWTl0cXlpL3VpYmdMZWhJTlZpRjhmUHdoSXY0ekNHVlp2U1l4?=
 =?utf-8?B?eHVhcUNqSXVjbFpCbStDdVR4QUkvU2ZpTGkvaERaV0hrYUhTbktSTi9FODE1?=
 =?utf-8?B?bGlwdGVacFBtNGlYZHpNSlRzekFFamlFVzJWZVFIUFB6YnIwTHV4TFFYYndw?=
 =?utf-8?B?c3AvNFF6T3NlZ1BxZVpWWGRuTXN2Vjl1SjVVbm1GMlMzUEpHR1I4WW1JMmg0?=
 =?utf-8?B?bW5EVEczR2JLbHFpM25nRXJqY3JYZHBMY1ltcUw4WGNFK0xNNktZMlZqZ00v?=
 =?utf-8?B?clZxdkxvSE1ZUFhCWHlTTmJxOFVaM1dXSnBxU1dXZDhtQnFFUWpKQUJqc3FE?=
 =?utf-8?B?TldwdkxtYWhZbDdYRGljTGQ3aFNhNEg0TXZ5QjRwTlRoY1ZGQ25FcThBMVAw?=
 =?utf-8?B?STRmMDFzREUwSjFOYjRPcm9NemFuNFNFR045MmdGWFI4S3ZxSTRJY1VyTEFI?=
 =?utf-8?B?ZVEyakpqalU5WUppdkxDYzRvQkdjY0gzNGZJdUFuWkdYVS9YNFAwT2FzdW1E?=
 =?utf-8?B?TzBaN2dtMDQycURwTDVjaDYrS0ZKVFRHVVlKYkVkL1hzM2RBNGs2VTlPS3Rn?=
 =?utf-8?B?OGlXVDV6c05EVFJtY0RJN1k2NmQ2U1EzaUZaR01KaDRPamFlenRhYW1uV2N1?=
 =?utf-8?B?d21RUC9VWitGdWlzMkc5K1h4RkJMWU5JS280L1RSNmRDM2F2ZmU3czVYblB0?=
 =?utf-8?B?YlF5c2ZhVVRja0RFWFVncGVxWXN3bDdGWWxTRktjYTA0NmRwNkcyREtjT3Ax?=
 =?utf-8?B?SmRoNUpuMVFGSERoM0lyejFRQ0NwaTNQaGtES094VG5VL2QrYTVaLzRMUkVp?=
 =?utf-8?B?a3hZbVBaUGpvTzFpcjNud29GWHB6Mk8xRXc4RDNYMDFJM1ljZCtBWUF3Umlk?=
 =?utf-8?B?TndvYng2dkVJb1BkUE1GKzMyTWxmUWJOL2hoYzVSZENhMDNsTE9lWFdkS3E3?=
 =?utf-8?B?N3czaTZVTFJpTm0rZHNReW55dmpiYXpHWUEyc21xUTRkYzFCQU4yVXUyTDdN?=
 =?utf-8?B?WThaQUxOaTIzOVNoZVZmT1JUWkpOR2c4Mm5TSEpiYTNDN09EbGlRYkRMUThs?=
 =?utf-8?B?MWNqc2YvckN4RnV4VDdJMjdWWHBjRXRPNlEyNGhXTS9sU0R3cXk4L0JjMEpM?=
 =?utf-8?B?NjZYNUdSdXl1NjRGY1FMVUw0amJuRVdDMmFYdnFxNEQ3OXVxLzdmbHdHOU0r?=
 =?utf-8?B?azkyTTB4Ym5EUDhTSTJIY3BNWk5LUU42YlZqODA5eTJQSkNmRk8zanNKdHBC?=
 =?utf-8?B?NFNzVDdoMEZGOVcvc1VSdnVSZTZHc091M1M2ZmdabklJYUJSUGpweDU5OUY2?=
 =?utf-8?B?YzJJMUtNY2dTeERrYzdtZzVRYUZVWXgwOHVLK3NRN3NnYzZuTVl2NEVwdC9t?=
 =?utf-8?B?aEtxR1FOTGJ5RkdTQTZ4bGVqS0dITld3QmxuRVBFQmptVnFNQWhiSUZlWUNZ?=
 =?utf-8?B?VDM0Q3RCZjA1OGdub1VSdGJ1UnQ1VkhqRDhBNmV1NWtMSTBvUHpSSDFUTDl5?=
 =?utf-8?B?UE4wQVNyaUlMd2lkM0hrSUduMTFGRktoWjBQTmZwNkk5K0xYbkkwejV6Ylhm?=
 =?utf-8?B?SUVWemdxL3dNTVpCUlEydE0rcG9pTWlCcGdNNytnb2I5amdZdnl2MlZyR2dF?=
 =?utf-8?B?UkZJYXozbVBML3ZVTWorZ013L0dORzNUU0JaWjdKdlhnS2xFTnZoYXp2RHpk?=
 =?utf-8?Q?7nsINK4VTgRxXrTSpWVWYjxbJ1A834H7zdd2TWU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea04b627-bd38-4914-8620-08d8d3fb2a09
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 10:51:36.9350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PptdD5yOZNC3bOkEJgrwvw5JVXaFXZU1VWkF8KHiUc/C/oswCK0ZCUaSzlhv+WgaRs/Rv/rgQUM5kGo55aPEjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
> When toolstack updates MSR policy, this MSR offset (which is the last
> index in the hypervisor MSR range) is used to indicate hypervisor
> behavior when guest accesses an MSR which is not explicitly emulated.

It's kind of weird to use an MSR to store this. I assume this is done
for migration reasons?

Isn't is possible to convey this data in the xl migration stream
instead of having to pack it with MSRs?

Thanks, Roger.

