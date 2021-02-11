Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09DE3182E7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 02:09:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83741.156610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA0Sv-00009u-9t; Thu, 11 Feb 2021 01:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83741.156610; Thu, 11 Feb 2021 01:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA0Sv-00009T-6Q; Thu, 11 Feb 2021 01:08:17 +0000
Received: by outflank-mailman (input) for mailman id 83741;
 Thu, 11 Feb 2021 01:08:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzmj=HN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lA0Su-00009O-87
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 01:08:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ff5b641-6e16-48e4-b0d9-508566a6165d;
 Thu, 11 Feb 2021 01:08:14 +0000 (UTC)
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
X-Inumbo-ID: 8ff5b641-6e16-48e4-b0d9-508566a6165d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613005694;
  h=to:cc:from:subject:message-id:date:
   content-transfer-encoding:mime-version;
  bh=h4Rb2NlNlrWX/8HboqWgNxrgkJDnC9nh/PCJWVmgfRg=;
  b=R3Cssq1UCrO9tUf2xO9Dyo3+KDn7vMBhGXLOhwV4uQniaAXPs9ch4sgQ
   sQoN8PLVoYAfKrMJFFhqF85tQ7tgjWpWb5OXtd05MnhZF0byW7sj/caJA
   ZHQ4/LzqY6QtC5D9BZtf2XmpuvBe3IYMi79GFTAzrgPa2NeTFyEZiO0k1
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DqxFU/Mg61dDQZT9r2vtkB46ZRXThQzEWxTbygXes+Ace5Ea42gb5uRvcsXz8fmRKx0zNcvUzk
 vIFgv/CyF63ykiWcWZKwSiiiyjaUImr0TTLJElIbczoUpUlSNxzeMXTYVlF5fvl+4gw44Emfm3
 iAtvSBwq3VvkyvMyHxuEF6B0WmiqzA/CwHmmbVhtWueb4G/qsF8GyWyctodZtMKb4j23f5CWV/
 MsAfZIJbwETPa77NaqeBZ6vxeNDwug2W9bZ7ftfVsjQ8qgEQ4PXEpIcKKHNcyUYOzvYZaPfTRX
 vB0=
X-SBRS: 5.2
X-MesageID: 37204297
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,169,1610427600"; 
   d="scan'208";a="37204297"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/ouGc3t4Vd0ouoEiYHwKFBH2VSPxFbgZXKYYUH6gFbHTPaDuzW+ClCTLpNevYdHzzEd9V+I7QjkcRRDMtQlMxy0K/SYChJqjH1DKqhTZ82pm+D7zzZzppnnh02gUsFRAKwiAzXRq1i/lik5PlH+qH+hc8SWk8wf29QQXOgRxM8nk27t/KCfBvArAGqMJEscotbPBflpFn9cvjNv+gX3JwCAD9nggnoPK5AdvrhpBRcep4mdeZ2AE5RTVVu6WY3fS1eNaD1qWeZ09mXBhxoYi/uaWbfpcuy2TGsmM8XgMnaMfj7BsFeAhF2xPt3s38gedn/MiMXwAwoBm1upImcNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4Rb2NlNlrWX/8HboqWgNxrgkJDnC9nh/PCJWVmgfRg=;
 b=G2LugsQN7g88NwBt8snmzrweGx6xzZEyvHbRbTunKmLQRyoOeQrmB1/IKeDteVa8zDe7Xroqy/0UwmPzScx45g35meiIrfF3m+dPSqVe9KvscTE5THgBmNvul5s7b3+PNMxyaqtxriw9e8iYuGYjYtH1z1Abl07UFwGdT/OEo4xYpgs8oVNaQ4kzeoYTEQzTp39q4dS52l3S1r05LlfelGe2PcIQHxsAwbdonKql/gFxAJq/W+QS7ONqZuWsRmC95+ENS2YFzP/gTztyeFaMuUUZWRB+3N4oV5Nc/unKZEeiCbbbPmloSbQg3q2GZzgd2cLKl/FDhU/x26XUL0J/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4Rb2NlNlrWX/8HboqWgNxrgkJDnC9nh/PCJWVmgfRg=;
 b=mIn3dhj3L2O85XfWELKgLBooharmBYY6w/UQvSTOLJAo6BTdQt+mdUENPeR179hVXbgW8wkit6PgRxfACk1DD/aAVU3GyrATh5IT9vk0lToJ7Rpbm80nGSocRb5tBNBoX1Tyfw9/auzJWpY/FST4gPhKetdN0wtDodwINRz9yas=
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Stable library ABI compatibility checking
Message-ID: <22a01569-1ea0-bb87-eda1-1450d0229cf7@citrix.com>
Date: Thu, 11 Feb 2021 01:08:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df49b5f2-7354-46da-4988-08d8ce297e5b
X-MS-TrafficTypeDiagnostic: BYAPR03MB4119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB41192B7160430E525BD72731BA8C9@BYAPR03MB4119.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmFMSVc4WVl1MmxrNU13bWs1QTZDM1ozcnBJUjRUUTZVNDNEaE1ScnhWYUJx?=
 =?utf-8?B?aTNwVXBZY2VKZkJWRmFLejRGZ2hTZjNGd3QxcEpMbGplMnlRQ1FhMkQwNFVk?=
 =?utf-8?B?RExDdnA0bm9zZmZyNWJMSEVRY0w5NU1XTEVqZlJSUklrcU5xcUxTb2RneEhx?=
 =?utf-8?B?UFBMdER5K1FVNGowUXhibDZjSmxVVVlhY3d3R1QzejlKK3VjdHhQT0J2U0pH?=
 =?utf-8?B?MGxPdW5yZlFkTVVpRWV3OHM3VVdWN0pjbzY4SDRualh4RXNUVnVoQllQYnZx?=
 =?utf-8?B?VEF0QVcweERsK2ZLNlQ1c1JBSWUzNUxZaGM1bTlYR1N4N1Y2NmtwdUtDaFh4?=
 =?utf-8?B?ZmpvMmxHa1VzR3JaSXZYSmtwM3hIOU5jWGhmV01KamQ3dmdaclYvTnJrNTJt?=
 =?utf-8?B?Qit1MTZHSmNVMWk0bERnQ0ExK2pTbVlhMUFTcHUxWFFMWEhIbkFpVkxWSG5v?=
 =?utf-8?B?MmI3THBlNk90L21scStSd3hjQmovV0g3WVNpV1NyR1dQaldZZ05TQ25mQWZk?=
 =?utf-8?B?eWtTL0F3citNdHIvOExubUpEenRnYW1NWjhIZG9HWGNOMnZrN0wvdjBiMEc5?=
 =?utf-8?B?NmhvMUlDbDlWTzdJdGwrbkRZNUs2S1QyaXpBMUl0eEhVTHEzWlg2SWRJcCtT?=
 =?utf-8?B?SWhEZ092UjVVM0lRZHd2NEJEVW9DY3BkTkpWeFpJWDE4RXh3bml6TU9Tc2Vt?=
 =?utf-8?B?K2VOemh3UFhzNDByWmtXQSsyZVVXalg3QW5xa2lpa2VGaVVuemVCK2tSSWp0?=
 =?utf-8?B?UEtDVWRTcTIreDEwbW5vVEJWa0xyMFg3Slc1N29xcVdvOWZEaUkveXlEZ0pW?=
 =?utf-8?B?a3ozdTQwblZLVm5lejV2ZDFTenBIRGxvN1g1VmN0RGdSeW5nbVdEem9oOUxG?=
 =?utf-8?B?ZUVTalhhR2hQS2hwcmNtY2xYZXNDMjRUdm9Ja2hyU1Q1a0NXSHM0cWhnTEdO?=
 =?utf-8?B?TThPZUhMNnA5L21pbEg1SDFjc3pZeCtuTVV3eXp0UUR6aWxyT2ZQcW5sYlRx?=
 =?utf-8?B?WkNQaDNTMGdNb1dud056Y2xORTNmWDBBZDZqOGZ6N1FkaWFVWFpEd09ENGhG?=
 =?utf-8?B?bUY1ajVvT2lXT016aWkwZVE2T0gzL2h2enFzbWZuRUo1clVFeXh6OE9mUyt0?=
 =?utf-8?B?b2hobDNuMGtReG1LbWJPQ0lUZEVHaGo2WkZBYTVRbHVpdjNiZitzVGpYU25E?=
 =?utf-8?B?VlV2bm9GUG5aY3JPOEI2a2RQemMvVU1EZGdrWWl3WEJYaU5HUDJlb3JSRElS?=
 =?utf-8?B?aTR6QU82TmdtZ0dOMmozcmdvTEMxRUVEekVjSjlmZlorbEp5OFZGb2J0Y0E3?=
 =?utf-8?B?S1gvcVR1aFFoTmcxOGVxM2I4NVNPWDVNYVN3K1N0Z1IvZGhFblh3UDlHSkUv?=
 =?utf-8?B?YUdpUUt0RmFVTXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:OSPM;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(4326008)(6666004)(2906002)(8676002)(31686004)(54906003)(66476007)(66556008)(16526019)(2616005)(956004)(86362001)(5660300002)(26005)(478600001)(8936002)(6486002)(66946007)(6916009)(316002)(16576012)(186003)(31696002)(966005)(36756003)(43740500002)(45980500001)(579004004);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eE05blNmeUx4V3lZNmQzMzdwQUMxVndRajRRRjF4ZDh5bVkzRlQwQzJJL2t3?=
 =?utf-8?B?WnNGRVMzU09vWHVSK0t0Q2hKM1dLbXZYbTdCNXRJWFlWVHNVMS9UcUFIZnZJ?=
 =?utf-8?B?MTV0bk4xaGlWVmFoaXNQbnFXVDRmRUY0MlgwN2taRzJ1OGNmdUJvSCt3RjFr?=
 =?utf-8?B?VmtGN015Y0J0Q0tBSjBMS0o5MnhZa2RGZFNpc0hJRk1tazdaWjJHMjR5eFBD?=
 =?utf-8?B?S1hiTFhrb0Z0NG9iaEE4ZDBENWt4NysrY0o2bzZkbXNUQ0dqTFVlTGZyeGJI?=
 =?utf-8?B?Ynh1MGJ3blF5OHlVa05UQytNZDdOY3RRUXNLbzlKVEpiNlhtTk4xRzYvMm5j?=
 =?utf-8?B?a0IvWFVaaEp6NjF2blk1QTlHQlV0Y3FFdFZVWmE2UVBOUVF4MnA2QVg5WlVU?=
 =?utf-8?B?NExZbURHTkZJcW5YUWhWdkVSVG42YlA2NkJGeHZmanVlcnl0dTRlVzh5VTlC?=
 =?utf-8?B?TG1Mb3R5aDZqOC9jc2Z6VFBOUHdrU1lQNjFNQmVxd3Vqelp3OGE0MDBmVHZi?=
 =?utf-8?B?TXhjNmE1WEhkUk5hSUpsL0tNWllWek1XLzBrTEVTWDhBUDNZZVNyQU13NVJ6?=
 =?utf-8?B?QmVLMGszaTRTVGI5bm5Gdm5TekJaS25qajV2TTdwNVBOYW4xbysrNmJaMkJw?=
 =?utf-8?B?QTAvVDdadzE3Z3lHTmQ5QURBVUluNG1PMWNKNzh1Y0k0QlpCWFdmUW9uUlVp?=
 =?utf-8?B?cFFpWXcwM0lYVW03bUpiSGRGMGM0dTRFS3VTRjRYQURGL1F6QkpOKzJUSkhj?=
 =?utf-8?B?M3JwQ0JDKzdkcFowQVh3SHRzNU5HeHVWS2JnTFVoNTFQeHpEMmUyL1NPTERJ?=
 =?utf-8?B?VkZYRlBQSHExQnM5TVNZYmVmMDZHVGNqNGtoNisvTFVFblY4VnFuWXd5dXZ1?=
 =?utf-8?B?cHRCanV3OXdTSi9DZ0J6NGs5M1NRUytNZVpKb2hRWXhpdlg2bEZiVXJkZlBJ?=
 =?utf-8?B?SjRIOUEvemFWWXZmTmRUYi9PWW9iY1dnaUVHbTRmMktHUGZVSTlHemJ3WDdx?=
 =?utf-8?B?eUdJc3dlY1o1V3U2WkVLb1Fva3dSZzN5dG9pRitXK25yOE43eWZ3OVdkWWhy?=
 =?utf-8?B?a0hJQ2xoU2orOTlVL2FSM0ozYVE0SW9qZk9aZ3ZrelgvR2ozdXVUZ3ZxZDRZ?=
 =?utf-8?B?aXQ3R0grUlc5ek1rWW0zNFp1Rm5tTklXcmVwRGlTaERITWlqUEExKzRwRi9K?=
 =?utf-8?B?dk1CZTdpMmxNbjdqQ3JrTWtBVXdneTY4N2J6bG81YkdMOGloOWl3UENMZjVi?=
 =?utf-8?B?OHJMRGNibXRsMDQ3Q2t2aFBmaSszSDlTL2VPNjFMVk9ZUUNRK2lGcWZaTnk0?=
 =?utf-8?B?a3hTOS9NNGdqYVdOa2pEbDZpcmZNakVPNWtZQy9Kd0VqZWxhME5TTi9qKzcv?=
 =?utf-8?B?RHdYZURTckQvSXhCNTJJdExiTHROYWxqSTQycHFlNVg3b1JsU2pWREdnYjBz?=
 =?utf-8?B?aklEL3FTVVlqQmY4ZXhnamhIZTFlcUM2aW5IWjY4bE1SUlhHTm5tVEVYZ0hI?=
 =?utf-8?B?bThmVTEyUGJ5WlFQdnFBMjlWR3g1M2l0VWVPU2RYUlZhL2NZclAxSERENXdy?=
 =?utf-8?B?K281c1BiZ0tUS1FYL2UvekZOOHpjeTBqaHgwTHMxNHd5YW5KU0I3NXFlN0to?=
 =?utf-8?B?SkVRVFJYVzZ1Rkg4bENFVERyUWVLM1YrNUFiZnRtRUdJWUNReVBKeWd2R3I1?=
 =?utf-8?B?cXhFN2I2b3Bkd3RZWUpQYUYrL2VIOUJjOFgwWkVGbVZCa3BpUzVuOXltaUFp?=
 =?utf-8?Q?kfqOI1eXXE2sP0cUn+DbTH4j5OuUk7fPa8K4pSL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df49b5f2-7354-46da-4988-08d8ce297e5b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 01:08:08.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6GSYXdwPHIt4cw6h5b5+UhxmyJsC02cIjCqmuD7D4UH88A/CYyuEROqqSj564GKgy7aKHfNhtYinbIljfGDsCIsN9OJAY+P4X5i/Xf6ahA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4119
X-OriginatorOrg: citrix.com

Hello,

Last things first, some examples:

http://xenbits.xen.org/people/andrewcoop/abi/libxenevtchn-1.1_to_1.2.html
http://xenbits.xen.org/people/andrewcoop/abi/libxenforeignmemory-1.3_to_1.4.html

These are an ABI compatibility report between RELEASE-4.14.0 and staging.

They're performed with abi-dumper (takes a shared object and header
file(s) and write out a text "dump" file which happens to be a perl
hash) and abi-compliance-checker checker, which takes two dumps and
produces the HTML reports linked above.  They're both debian tools
originally, but have found their way across the ecosystem.  They have no
impact on build time (when invoked correctly).

I'm encouraged to see that the foreignmem analysis has even spotted that
we deliberately renamed one parameter to clarify its purpose.


For the stable libraries, the RELEASE-$X.$Y.0 tag is the formal point
when accumulated changes in staging become fixed.  What we ought to be
doing is taking a "dump" of libraries at this point, and publishing
them, probably on xenbits.

Subsequent builds on all the staging branches should be performing an
ABI check against the appropriate lib version.  This will let us catch
breakages in staging (c/s e8af54084586f4) as well as breakages if we
ever need to backport changes to the libs.

For libraries wrapped by Juergen's tools/libs/ common-makefile changes,
adding ABI dumping is easy.  The only complicating is needing to build
everything with "-Og -g", but this is easy to arrange, and frankly ought
to be the default for debug builds anyway (the current use of -O0 is
silly and interferes with common distro hardening settings).

What I propose is tweaking the library build to write out
lib$FOO.so.$X.$Y-$(ARCH).abi.dump files.  A pristine set of these should
be put somewhere on xenbits, and a task put on the release technicians
checklist for future releases.

That way, subsequent builds which have these tools available can include
a call to abi-compliance-checker between the authoritative copy and the
one from the local build, which will make the report available, and exit
nonzero on breaking problems.


To make the pristine set, I need to retrofit the tooling to 4.14 and
ideally 4.13.  This is in contravention to our normal policy of not
backporting features, but I think, being optional build-time-only
tooling, it is worthy of an exception considering the gains we get
(specifically - to be able to check for ABI breakages on these branches
in OSSTest).  Backporting to 4.12 and older is far more invasive, due to
it being before the library build systems were common'd.


Anyway, thoughts?

~Andrew

