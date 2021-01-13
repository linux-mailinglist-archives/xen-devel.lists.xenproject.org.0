Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949762F531E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 20:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66734.118652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlYa-0006Ou-5S; Wed, 13 Jan 2021 19:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66734.118652; Wed, 13 Jan 2021 19:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlYa-0006OV-27; Wed, 13 Jan 2021 19:11:48 +0000
Received: by outflank-mailman (input) for mailman id 66734;
 Wed, 13 Jan 2021 19:11:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzlYY-0006OQ-Me
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 19:11:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac0ff77e-ed33-4b17-ba61-27871f880ba5;
 Wed, 13 Jan 2021 19:11:45 +0000 (UTC)
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
X-Inumbo-ID: ac0ff77e-ed33-4b17-ba61-27871f880ba5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610565105;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YSTsyy9xERzkzPo6RpPe8KA0pGecJcW04hCZHWi3STI=;
  b=U0hM41rgD7sHMDMqPtpxSMkhSuqe4jY3nrbDUkyGYIyyy7q2Ba6XYxSu
   Li3YemOZjSH8SaVo/q3aRwSLDFQbk2M8rkmRPvLFt9v/7g6E59fiiO8Z3
   mRqVmFZrHiEJG5tcxwCNjTAxNXWRNQ+s6gc3DDtF0oDypZgFYCtml7mYA
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uCHH+bQI/9/0GFHyyFOZGJmyMIMLWMRxDbATQSI27FephLT4utbtCMrI/QL7+gGjN1pBw/MNhk
 2gBToqnLrBC/zhxJVSHWnjjWCnKWPoGWVGre4s5XYu5XbePoK6oISOLikhb2AAvLSmxlPWLKs3
 aCC3bZ6TKTlXMGY53RPQSOoanbK9EKxAYrIF0l194RS+98ph37MLD63vdfWgeSPX8fBbq9n9ro
 8Zc/+wgH4njEbcLMyMVsvu2JTeQdJbfCmoBaeQouvaL5rE820nk8vytMdFIQFisutbV87c5rdQ
 Ne0=
X-SBRS: 5.2
X-MesageID: 35021692
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,345,1602561600"; 
   d="scan'208";a="35021692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3EtVTMtMWfchZMEDkswJNH7agW+BxsdMQ/tyeu9P6vQZvBzqbH6TA2oLAl50LeXavBhOo73XoYy1hIDEEuGTpyIt+mAxZ6QVetlMzX4T+kUB7KgI199a7m0B1WY+jS+oH3hVz3pgDEhH2RDi9nIZhY+VADOjXcBdGkW5CzNlhIti6zngQEr+Iu3/rDw7j5YEoqmzAGko9CzA99dk7VRcAsz76cChBGEnYm06s0eQVd4gCnZxfCveepsQRk5yvwTWuSdHlGPapBN2A0S3XZO7RpTyW1H/bL5NBVnNv6laJyymCcEZjHfXAYnmXJessV7XsA8ogsuSJ6qHmK33UtUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSTsyy9xERzkzPo6RpPe8KA0pGecJcW04hCZHWi3STI=;
 b=hPyx7BXhL7atyvuhZ9jQMRox7H0+jg8MVVy7h5o/X2YdCGgy3Hw6JuapUs00zk5vUTyL3RQdXPAbIWE++NyG6pLqx/360QVLnxUBJXdAE35LKqj+HL00Mwn6BARoX3ZwpB8ZjTp/rjEdyHcFAv4ThAJxrrgoTmqD/CprBqN1Wm3cEM2qlpVBRrWNgPwTNcnvOA8UPPR39A3/Iq1a7TIXUq/U0SJk3K0HaRHSsrSi0VlFiY6SNXNVo2QUPy8SZ0nG3KwrrfC5QC1ZnFqAZlmGJjAJ8sQgcpWY97x95+0K3Jkwhx+i2T97CDVP2k5FDmzVL6d4jgmm6H7NTIPCj1CBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSTsyy9xERzkzPo6RpPe8KA0pGecJcW04hCZHWi3STI=;
 b=Poe8QCX2B+MH80pXmuolefLzUVD14uvKSA21uqXkZh6taNjydBwupJdl7LeoNdDgT+WsdZ053BFtSS+1rimM0XV0ERSqg+dtbWCufLCismP4ehRvixW+CtA3vRaiy/4/hI1W9VLrU3aAXm98QrYDkjCFhwkrTv4NFQCaII83xS4=
Subject: Re: [PATCH] x86/mem_sharing: fix wrong field name used in 2c5119d
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
	<xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <fcc458c391c6c43cce9b393cf7eb197a5428273e.1610504682.git.tamas.lengyel@intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <308ee8aa-5a7f-91d6-10ff-beb9fac938fb@citrix.com>
Date: Wed, 13 Jan 2021 19:11:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <fcc458c391c6c43cce9b393cf7eb197a5428273e.1610504682.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::26) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9914e21-8c4a-4e55-1531-08d8b7f70e7e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3879:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB387983F72D4776E1376A222ABAA90@BYAPR03MB3879.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nJM5XcZuLhbnqJ8f50JhYkOBwELFGuK8Y6V9Cf85UeXXIwxPmYmDuBEWANjrGXZF8/WEHxwqW89UILxTh2jvoKPQGbc/wZmtjjvEsCsGM8bmZv9xWaan+4WDlgeJAHTdqNopva1cfpSZdH4/O4Ns93dG7bgM5Y18PzPdu46YxNYrbi9WxYeorRPxS+fqZ/9Qp+s7mBSUbzt7XkNTaSTj+8+jF9dz07zVQOPKlg6GLzC9V0YkuKO9KBE4Y+4upby5qeF2qrDn1SzOZFAZNxSWGNho8wN2uFkT2HZ8FvRXdLZZbt+OS+eFfIYx5qAMKncogn9ARF3DBT2qg/lAw2ZGP4kQuFnZc7uaf3pfYcRdYF9ibnSbqULYf0aySjjj7rmpEE8RiPXoOsIy+weJfVlqYPuFD1z2+kNeOI1bk+DRcJUZXqD6yZcd/L0DDZgEd/PRKW4Eg3CwyBwCb3lDeELu+kieBQ2b3Xe/sB/SMPD59UU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(4744005)(5660300002)(31696002)(6666004)(53546011)(2906002)(4326008)(316002)(8676002)(8936002)(36756003)(16576012)(31686004)(26005)(54906003)(956004)(66946007)(2616005)(66476007)(16526019)(186003)(478600001)(66556008)(6486002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0ivRogVoSHtgCJIwyRTfF2moBdqpoX3LsbbA0/U9XO/ANZCQ90pJ9BTZCgBKgOTYsqu1pbw4SDelDnfo0RuyDxaR1oFV7GER42OurI24QB3esYet6/ICPfR/TIcDHFVT7h7op4KYAdBEjj7Zte8XfuyjNUPkioeMeJdXP8sKaxxrXMzIFKnW+OOtC9JRWml+uEmXpIpKR8+zCHtUyW1m6TK78BllmhpQ9htJ0gQI94v9WfSPd3C3dgnx8f0DzyXpwSoZ+HWQJX0QWid+6oVRRh07Yn1sg2hlZuKF3uvcAOEigXWct98M3cnGvks+CalkwDrs2sloNY4TZcUbnSMYpNvS60wzYsIYGwfJRVB4xqVJSjN3a1quH0EZdYiO9clI1PAgccNfgXBb4bwvcYghZOXGYfY9m8XE8K+G4o70J7eDIxqebqPKysuU1iKQdpoYw+v8CSA0SqdT4h+DTmE1XKxPXnLdNnxFftkzciKJJwDLuRkK4gR7P2/jiJT1y/rsBAdYtwsL+jtQ+f+lkh7Bw7AA2s6gOS7QqoCEHCd28/e4OUemxlvq5SZi6x9db9K01bR2g6tasPIfslGsToPfTUv8WOgP2g2pd1dH/DMQKywm3Ic7Jt93kTq/21ZrMGIHLrw1Ib+M7CpwKYGk9VNR89Y/oeNVM1SRUteuzFb+tXbEC7Ypiub13gsaTjaX2nxvSRxiirt6zQbW3D6VsFUqPpBUO41/Wu8aQw84njDX7P7TxAo1DsScPBedzt25UlnRjQ2Hq1C/tXgWbSu3diu0pSMfBMYIAxueoIdM/SUd3O9gNXtVXXuar/yej+7qq+l/Z1IrxcZ349TQzFIRjJrNF1kuFDfOIkKZT3kotQ78rSiS9iTe5xiBs76r8LdFTbBsy+Ur9E4gVnyt9w2HC0JpS0v5J89BwUTjiinalGK5paA=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 19:11:39.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: d9914e21-8c4a-4e55-1531-08d8b7f70e7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1J3jzrOxm3B8Bjf2EHWi+iRqwzFc+qMP5KFGyCmFjX9gXLOzXfKlJWQd2l0Yc6/z6569WulX6t5TbKK4T0daXnvRV2LDKrgovCbw45ph1zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3879
X-OriginatorOrg: citrix.com

On 13/01/2021 02:28, Tamas K Lengyel wrote:
> The arch_domain struct has "msr", not "msrs".
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
> I've build tested originally with "msr" but typod "msrs" when creating the
> patch that was sent in. Sorry for the noise.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

It was actually a Travis Randconfig run which happened to turn
CONFIG_MEM_SHARING on.  I'll add words to that effect, but probably not
a URL as its about to cease to exist.

