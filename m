Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C792C04DF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 12:49:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34075.64929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAL4-0004nJ-Om; Mon, 23 Nov 2020 11:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34075.64929; Mon, 23 Nov 2020 11:48:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAL4-0004mu-LO; Mon, 23 Nov 2020 11:48:58 +0000
Received: by outflank-mailman (input) for mailman id 34075;
 Mon, 23 Nov 2020 11:48:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khAL3-0004mp-55
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:48:57 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6efa7576-de90-4d40-a0e0-e31db62d4860;
 Mon, 23 Nov 2020 11:48:55 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khAL3-0004mp-55
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:48:57 +0000
X-Inumbo-ID: 6efa7576-de90-4d40-a0e0-e31db62d4860
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6efa7576-de90-4d40-a0e0-e31db62d4860;
	Mon, 23 Nov 2020 11:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606132136;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cUWVsEO7n22giDc6fslcuMPM4yHuaj5zi9uNbbapgAg=;
  b=XCI9VdCI94kgCtYpw10DUt/nNUSRjvuI3FPZR/vONtcjebENMvhFFfTr
   OmGRASB1UtX5zMfZ8nM0YM/fSQXObAq9PugBYA9ljkJ+KPHMSrszuDmQQ
   A8R6qWBV54A5aD7TusHSq2F3SB+9FlPsoanW65DFDoLMwgZTdUZh2CXKq
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oxEEeMk8Z75SMSuS7hG46ZdJ7NSuWcxehSCnA4BZ+PLmFspGHv6C1hbGsZDO5qO8lVKfjvNYo9
 ub4Y9f0f6OjPvTzpYTO8UQi8MPtWbvrIQgl0C8QQClj+SIDbchd1/gmUuJfwq+z2vDEs8kLqzj
 HaWFE71+fX/g0n5c+1zvHIFJhG5u6DMvCSHPtW4hXiv+dTWRDYkcvZK+IYeHpV6md64wWGa0vg
 lBYBVf7wY5FpTMmyDPFsz7YyQxKG/WU7aQPzGp2rPwybY4Tu3FpmIVdp/LLPsWVZOwvtGXYa7U
 E1k=
X-SBRS: None
X-MesageID: 31733249
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="31733249"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Snqi20AnYD3JAR1yrjTm6DDhiqzGmbR5nx2hIl/sQA/x14mv2kiqKHus7tFYeuvAGe8MvudkI01FrzHe4vQHS5J9qqBleASBbDKvRs4COOCUUQpLpnp0aN9MB5ZLChFZQ1ooaml3xHI2CSNX2dZbb/nydsGV8sb9VHWgKYt1AlKdvJfp02UlbSJsjm5tZ54z7ng/bRGoIhOXIFKyQQqu/Y3gM5NGNXRNvyWk19ZxNvT//ptLx4llb5StXKi41gqWf9WlZtWLSOJkDRG2I4YiJ8kjnEtyrUnwuVSctMuXHb8p1wODfmHUJ33YD8y6MGv0pi9DkPQMNcoSUTK8d55N+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db88IQDK/BpAmsJMUM22U2nhGSmJcS5NbW0gVk4oxLg=;
 b=D6Y2MwaXIGY4cWmRk1eMjX/ljIySkTF6mGWq7eCfq9bb38sx0kNVVpVRiRx5/t5Jl2+fvrAUUV17KGqbFyLE9bbbimkVbLLomV7QfP6eNWB4aMVyPEjks3cBmhdXsgsCifEcBhDcOhmIqtEOcgL64ntBqjIM8flZf4CUoGFvtkz6BCCEU7iAd/MPKyE9JZTyn2dOFNPZyl2V4dYV9hy59mJCzZ5oYtm9Ot3DCtFOa9WtOcVkh5qfF3ozSZSbihR6jgzJlOKL7RvClGJtFK70u113fn7fa0sVXLBcrmzYIZOpPNTDVjUV/F/pNpis5gLEIldGH66BYR4+PxA0Wanf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db88IQDK/BpAmsJMUM22U2nhGSmJcS5NbW0gVk4oxLg=;
 b=cFQo0JvfdbMWlcH5h3Lb5Cu+1Pl9gVwIZuTocNVKEwKnp8biVKgnIkbRBPaxTTgZE5c1kii4z+5W/+Gk0gYP55ltcTJQTToGDLCg3k4mvau1ZNIuAvOm87S5Ni1lefSweEgClt/g+oKkMNuI7PvKPgewIBUo3U2Hu93o8Lr1/WQ=
Date: Mon, 23 Nov 2020 12:48:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/PV: make post-migration page state consistent
Message-ID: <20201123114843.ocjwlv4wkukcdcgf@Air-de-Roger>
References: <07ebce3c-4dcf-bc9e-6d82-7f3def486ab8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07ebce3c-4dcf-bc9e-6d82-7f3def486ab8@suse.com>
X-ClientProxiedBy: LO3P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fad81775-fade-4f84-0482-08d88fa5bfcc
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5084B264FB44AD4F547AED648FFC0@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Pli99rWW7RqusZTV3mOC1tZ8DxoWfLAgT0LuND0/PGvmTP39lGBg8KknkrFVK2GGn2nRqvvtIokqpr4jjoB5xkEcnTsnoCir4oXUs/rO7ho42uc2q31+yi10bTJWJB7jJMQfGQmQYaRMvpD9MePVWVfxBIpeFxZT5THQnrFDO1B6tfPMNYBDPupBXt5Rb0m6/1xizETpszYMtHOE8jct5SZcyeCvi77qOGXep7FDFJW4SqP9u8MuaczxOtJrtlgt2NN6q6ZV143IA6DHTEux8//jBZvGq+GAAEVopwbK6SJAvMAnvD1KxW41WI0Vu12w7e9AXru1Sec6BgQMzdLkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(86362001)(6666004)(1076003)(4326008)(66476007)(66556008)(478600001)(956004)(8936002)(186003)(8676002)(316002)(6496006)(33716001)(85182001)(16526019)(6486002)(5660300002)(66946007)(9686003)(6916009)(83380400001)(2906002)(54906003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hsRNjIvZVMKfbih5MHNDqPAZCAuvMBBoIdfPIImqlTk/Yo8mnpO5kPJgZpAQnCY6QwiAs7AIYfdLFDxk7Lgf1IKco5FeZ/Mga0pw306fD/k8fWFvRICpfJXvOI5Mg/Kd+8zctLQVB2a5frlwajfuNLM6MO1VP5cQh59NV8EqbtKNbuQDFkwbvhORAIbZqCE6WF6FUgMoSfkM5/VlZdjAz3PcJLUAfWw8ZP+6V4U4XBGD3t/yYw9M2NRaIqxyXWhgWjpUq09rfxwpSl6p4dWbOCb1S/uGcbl0i1ahbmOQ1V4L9AazUIYLLVmhnhEDUU+hSHKSt/j7B/eRMUfow3L4n0JFh+zUpXqaZoCdziM4AAbYMcqzHCMjpD5IzEia0PBbbn81yAbJi5b2pBd0OKEOodmvV+41y4AKvALCmQIRglzlxTw6BPpPeHEy0UPRNNkbQIOqiCTm5R6DrCiUaGgaNe2uC7SGDld9uVaEAEhMUuLUzSY99qiu9ghz2fA0sf6vsDuQaHosthTcFpXVU8H/rTKCVlE0Z2KhUhnIcf1jN/z4CcTpdanR1PaOj3mgEHRyl0MuDucVQcAUS0BG1X4HO+C4YpjiJ4aZDO4VI/N9BrpJ2/nNOEmQRNH5Er6z3TIJI6tPNblBPATYHhWvbVGfiw7WUSaT3qkbpF6Fe7f6V8iDQ9l3mYldFzYrFJqCvN7mftQ8fDgDBl4k9vrpGFUwtS0V312Blt4nRmV9CIH9QfqnHuAwatvH9siaKaqEgYDd3btZs1TmkAgRevhpDWfJx3ChK1tniFDuqgmsqSyJyIlMr9efM238hGGdmuxkTku36Hhy3EkGhYr/2RI6YGKcw/OGOrQuAbahllvQuYt2ZG5IzZmSnYRHvQ5JyzZAUI2c/TaT7HCwdRGi7iVTUCRJwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fad81775-fade-4f84-0482-08d88fa5bfcc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 11:48:52.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bi1JeH5BapResXekZ5QYD5BSk6jpZ3tOBeyGyuacOcLxOjgKz/v9k6y2Mvn8quCBDycP5ep2iqh1RC/IXdFosA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-OriginatorOrg: citrix.com

On Wed, Nov 04, 2020 at 08:56:50AM +0100, Jan Beulich wrote:
> When a page table page gets de-validated, its type reference count drops
> to zero (and PGT_validated gets cleared), but its type remains intact.
> XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
> such pages. An intermediate write to such a page via e.g.
> MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
> PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
> return. In libxc the decision which pages to normalize / localize
> depends solely on the type returned from the domctl. As a result without
> further precautions the guest won't be able to tell whether such a page
> has had its (apparent) PTE entries transitioned to the new MFNs.
> 
> Add a check of PGT_validated, thus consistently avoiding normalization /
> localization in the tool stack.
> 
> Also use XEN_DOMCTL_PFINFO_NOTAB in the variable's initializer instead
> open coding it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Maybe the switch could be avoided if the page is not validated or
broken? Not that I care that much.

Thanks, Roger.

