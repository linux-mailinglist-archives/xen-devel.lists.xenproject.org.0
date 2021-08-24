Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443223F57F8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 08:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170681.311546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIPeq-0000Gi-Fv; Tue, 24 Aug 2021 06:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170681.311546; Tue, 24 Aug 2021 06:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIPeq-0000EI-CR; Tue, 24 Aug 2021 06:11:36 +0000
Received: by outflank-mailman (input) for mailman id 170681;
 Tue, 24 Aug 2021 06:11:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIPeo-0000EC-Il
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 06:11:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20c1ce10-04a2-11ec-a8ab-12813bfff9fa;
 Tue, 24 Aug 2021 06:11:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-_44sbAoiO2eWT_fdo5hd5Q-1; Tue, 24 Aug 2021 08:11:30 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM4PR0401MB2418.eurprd04.prod.outlook.com (2603:10a6:200:4d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 06:11:29 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 06:11:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0131.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 06:11:27 +0000
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
X-Inumbo-ID: 20c1ce10-04a2-11ec-a8ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629785492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CD0FWMFXLY+eTVIRCy7mctKYRIjHlhAEcF4Ef8INWM=;
	b=fhK2EQL9ReSN8kE1ajWuhXXD+da5FhWtix7qjRpQzmvd5J9eI5kEc32P5BGDaeVOdmyfuP
	JKdFZHM8BvbRAQ/YdUCKzVVhmXgVhO29/6MIvBhdCxvJ5hHrSTsLUORdSYttFPQFpmKhoz
	l+VeRqoMPWTEig54ufOqKMeWnKqQnI8=
X-MC-Unique: _44sbAoiO2eWT_fdo5hd5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw/Wkb8g3vK5sErrzDljt0gIP/sy+b3Bxr71vvxDzeGDSF4UxptFydvtG+FNmFps8V4s4r4+AM57C4M+9VjmLw6ssilmsr0zOpvFWImEGOaJWf5D6cAaEYZwnFOWI4mcx81gU35uIqT7xxWbMaO1ogT+IefkidmEUWzD/dmRyY+0wXW/OWxkgxBNmkHj5VLdAtKfBTW6d1hNCPF431sulbVGQHMMqPqTSz+X9fTtzzzTYvewHxBFNuh99+mHW4dmNginr75a2bvOieRo7kLuKKOecxRtM/Tp5Ym8A6wTQdmwrXv1Pq/91Gp1uJiC8QiXdr0rwRF8nnpzRIYoMiDPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CD0FWMFXLY+eTVIRCy7mctKYRIjHlhAEcF4Ef8INWM=;
 b=C377jXZVhBoClT3AsiHXxSzcpH9YQX8sbuc9ojTUAV/kz+LXGqwUasj6iFOeY5aq2zvXdRYBXZl0dybhBGkHZ0WLQkLqd48ud/m5m6XxSQEUeJQoM5jPQ4vOMeU58HVUZH0Tvudk4ws+AITgr8V+zl4+4rIYCxedfbn2A/akQY3/WD/ck9QkYtkCft3f9Cza1hUxFhyvv2+8FnUFmROW0RiBCQba5aLYfqIA/Q9YGMmQUynWl+oF9+Ym/8Rt8oTAq7kxqFBFIQjQeK3vdiN7t28pc+VZ3+AFfIshSNQkf724F/1lKI8O9t1s/iah/XvvUKfqtZLcmbMddsfnK/cmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 1/4] public: Add page related definitions for accessing
 guests memory
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1629737453.git.costin.lupu@cs.pub.ro>
 <22031be8466bb18d1dd891481ccc67d8c2b2dd55.1629737453.git.costin.lupu@cs.pub.ro>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <accc3026-1043-6b90-eda4-1951ef808bdc@suse.com>
Date: Tue, 24 Aug 2021 08:11:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <22031be8466bb18d1dd891481ccc67d8c2b2dd55.1629737453.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0131.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::36) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf2e25dd-fa6d-4f5f-4672-08d966c60234
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2418:
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB24185244DD365077AA9829B3B3C59@AM4PR0401MB2418.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yYUk22I6/Kp5EBOjzJ9E8aIX7gK9QWRTZrNer5Wzu8Cj8CTlQx6KuYqQHyAJ00uWyh3wi/PQWJ4aTVNgYi8HEzgU7jyOBr/4se5VUOsmjKPlwrCqpaX3AltSMLEK1BA0qx5RNOkioVzcjZXLCIT6e6IgKMI9X8y0U5m5YYLWI2KyW80BbFp7g9jIk32+5y061dTZLiS/4TWmSvdOtL/Qra4qSSW0f6IHEMxzYaBQUiKWU33tRlQMDpqk+rysbUH84VRyFLD6isRUpTKUz2EJjdejIbdPNB8Tilv37WuWxysS0Q+ecMI6WOE5NzgNqkfor4NKGFofl2+zLhMExLzo3JD5+xAqk9cU1fnSybESpWaTlhf7dnfkFAX7rn2kd7rQLlRwrJoe5qKnx4fmDngqj0jux6PayfjYREn/1Ya6xL1nMru0kidKpcavL5KCczJfk42XG9LHLkyq7b3HhYTa2T8xYZSgtNtNZ7rZyr0GudB7zo+9TO8lu8WTEKBstnMoy73xRXjDg9Fmt5MIGaUHqFXtudJUQzvrmWLD2yISvBgZSJU/yGE45BrCtismF4zEkxCKBGraj6BZVAaCSrRIH6Ti+qJOT1ALsGNl2gzNyxIOr6OZg2gufV+n6VDUy4DUc/aWT+ahNFj6GsmO8CvfluYGf67yxKp9XpvrCEVfzc9iyE3UR76dGQIiw4Y2/0u/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(186003)(66476007)(16576012)(6486002)(66946007)(6916009)(508600001)(2616005)(66556008)(54906003)(4326008)(38100700002)(316002)(26005)(7416002)(956004)(8936002)(8676002)(31696002)(2906002)(53546011)(36756003)(5660300002)(86362001)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2NqUUVxUnFqTkZ3RXRuZ0RYR2FsN01STjhoYncyWStJbGNENEFEekpxN3VI?=
 =?utf-8?B?M1FIUy9WZE1xWVpKd0Z1VFBJQUJnUllFcCt3dDkwa09UUnZPKy9MeldOUTFQ?=
 =?utf-8?B?Vlp6R1BUUU9QOUthL1lKS0MvSy82WTk3VDFlaWlGd0c2c0RBNUZqYlk3Zlo1?=
 =?utf-8?B?UEZZczRDcElUSE9qRXNUZ1d3TU1MVnpLWWI4UkJ0a3B5bXFBaXdtRHZLRHhV?=
 =?utf-8?B?YlFmLzhWVXQ5NkZTRUhsa1JCc3ZSMVA0Zk5YM2xkWVgwWE43bElENyt5RkxW?=
 =?utf-8?B?K1N1TUJKcTVoWWxSRHExRndMbS9iRnZjeFY2WWRaUFdnYklYSmhoL21qeEcz?=
 =?utf-8?B?UHEvalRkYTZXZEtCUllFRWd4OC9lTlJaMHhyUmE0Q215NmhmbXpCRzVTeFZC?=
 =?utf-8?B?UDZmbG9wZVNOUTRxU0RrRnVvTDF2UTVtdjAwSlkybG9jR09UZ25HaHVub05o?=
 =?utf-8?B?dFJ1ejhEN041ZmJMSHVqV3hmdE82K3lROURMOFl1SFpleTQ2ck1RclhnNW1n?=
 =?utf-8?B?RTZPTjV5ZmVJS3pPVEtCRXBZcmJoWXRXd3BEV3pkOVZNTEtXQ0xWelZjY3dJ?=
 =?utf-8?B?SWtVOEhyQXVETmJaaFF6RFpxMlpobndINHhyUTYycnZYbnhCRDdhbTFuUzd6?=
 =?utf-8?B?UTlvVDNHVmJQUFdMNW5tS0E4UW5qRmhuZWxsSCtWaWREOHFHZ0Y0ai9xOGFJ?=
 =?utf-8?B?dVVGT0Y1aFIwc2wvWDgzOXFaSkp6bjV3NzJkR3ZVZ2pPQVpEelNseFVYMDEv?=
 =?utf-8?B?emZmYkd0K1NkN2RVVThFOWlFdXVmZjZhOVJ4eFAyYVpCZ3lIWC9zV1QzRUUr?=
 =?utf-8?B?Vm51eDd6cm9jSkNDaVl3NEJuSENDL3g3RUlZZU1ObDk5RDYyc1FBS1J5RU53?=
 =?utf-8?B?bVhBZTNMeWNVNE1yZW1TY0NIS2lhYWtKWm5xK1dyL040Q1B5VllQK2pMRm5Y?=
 =?utf-8?B?K3dzZ21idUI2cnB1UWZyMlVmdExWRzZGWEQvR3lRUkY0Q1U5MWd1eUc1cW9L?=
 =?utf-8?B?OG9qZERPVks4S1djU00yWHl0YjRhbENlVG9lcVZDY1p2bXNIaW9NeHU3NTZM?=
 =?utf-8?B?ZTZoa1BoUnhvYkhKYTRHSzdzYjhzR0JDUitxcEUwdHBkY05yMllBTVRkMGEx?=
 =?utf-8?B?YXpzOFpsZnJBM3Uya01FaGsrc25VUnRSN2RHU2hCbmVoRXlTTTNGWm4wd1ZR?=
 =?utf-8?B?RHhZdUJxZ05vSEV6c3BIMXpvSHJzdWRHTUpDcERVMXVVVjhlaVZGNi8wSk45?=
 =?utf-8?B?dEZmN3F1NVpkMUIwbHVubnZQMlJiVzVkRG9yQTIwZHdJSjdBS3Mrc2RPTUQw?=
 =?utf-8?B?SnhLYXJPY25rTitKZytBS2NmekdwWjJLZTJlRlJtTTgvd0VXa0VaRzlOeGgw?=
 =?utf-8?B?OUQ4dzNHcjJUOVoveHJGZFUwdXVUcFBabHI5Z2JkWnFwSUtMVTFXeDYzamdp?=
 =?utf-8?B?NEtJVFhGZ1UzUnlkakJibElna1JnN2p6M1NINkNrblFOd2MwMVRRNU1JeG9a?=
 =?utf-8?B?cW9lL2svQ1psblJ5MG9XODZobGUvb1FtOVpxKzdyemZRQndvY1QyOHNhdTZp?=
 =?utf-8?B?a2ZlclBWVFczS3BWcU5qNDJRbzFhL3FEcm1tT3BKTk8zUEZLcVg0TW1Pd1lI?=
 =?utf-8?B?aUJXeUFQWElRck5qdjNmYVZVSTMwQzFsT3dwRm1JZnY0QjJRQmdBSFdISWdt?=
 =?utf-8?B?cldBR1hZd3ZPd25CbTd3ZnBOc0UwdFhmWlpKaXNQUnZFZGYyckR3ZkZYQ1J4?=
 =?utf-8?Q?AAUpHRtim+sEFvVP83WmhO68Et5A62Z6P4QgOoJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2e25dd-fa6d-4f5f-4672-08d966c60234
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 06:11:28.0571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2O/s/oS/WRfCMCzZIBNjD7kbB15BB5Md6xa9rxjp9wiXc1owXG5jD8m5yvDlHV+OGehvNwzBcHQqGFQGpB4sSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2418

On 23.08.2021 19:02, Costin Lupu wrote:
> These changes introduce the page related definitions needed for mapping and
> accessing guests memory. These values are intended to be used by any toolstack
> component that needs to map guests memory. Until now, the values were defined
> by the xenctrl.h header, therefore whenever a component had to use them it also
> had to add a dependency for the xenctrl library.
> 
> This patch also introduces xen_mk_long() macrodefinition for defining long
> constants both for C and assembler code.
> 
> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>

x86 part:
Acked-by: Jan Beulich <jbeulich@suse.com>

This extends to the common parts only if the Arm side gets an ack,
since - as said before - there you're treating use of one unstable
interface (libxc) for another (the ABI) in supposedly stable
libraries, or - if the ABI is to be stable despite being exposed
to the tool stack only - you make it impossible to make the page
size variable down the road.

Just yesterday we've been (internally) talking about the similar
"maximum vCPU-s" aspect: This shouldn't be taken directly from the
ABI by tool stacks, as imo we ought to allow the upper bounds to
be configurable in the hypervisor (with the present limits merely
becoming limits of what can be configured). This would similarly
require a library function (or two, as HVM and PV limits are
likely different). I wonder whether we shouldn't have a stable
library providing functions to retrieve such limits. Initially the
library would return constants, short of the hypervisor providing
the needed data.

Jan


