Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC35B3936
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 15:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404368.646815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWeFz-0000Pa-In; Fri, 09 Sep 2022 13:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404368.646815; Fri, 09 Sep 2022 13:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWeFz-0000Mn-G5; Fri, 09 Sep 2022 13:41:19 +0000
Received: by outflank-mailman (input) for mailman id 404368;
 Fri, 09 Sep 2022 13:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWeFy-0000Mh-5H
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 13:41:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 140d103c-3045-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 15:41:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5716.eurprd04.prod.outlook.com (2603:10a6:208:128::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Fri, 9 Sep
 2022 13:41:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 13:41:14 +0000
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
X-Inumbo-ID: 140d103c-3045-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOS/JwIw6TCcU4PQ6qn1oq+VpjFCGjLlScw6LqiQ+4CAuqqFcuV5t6IRdygZUmsWbaRvBkzr5WbtSiYmheoEmXgew52Il9EaNh4gJpOKer9Y8VBSG6usppNwjf7XGkSz4kkeGWcfurMysNe6OnkepdXBI/5T02rpSRcQVERpwv84SuIuVfPmrwhAKPCy+6Lch+FLs8UBxbC4adUDpwQc0QURmDjAbaoyDhv0asZsT0rEtuvOHCWXnzTQ1t2jjfOGOEqdVAVX5MJwwH0DpYze+EQFK/kOT9P2FTUX9l5hgkxZgFuDJwXVDXXSdoSg+hz8K/hmJ4iKfQWeBr3U1v9mUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ggjmk5fUGkioYbiuHrpgmwF5jPPRaUl0+tSSXX+oN4A=;
 b=fpYrhEGNFb8FVF1UsoFossv9KQ0aTwM9IZm4JdoaFT52QPRGhPWUtH96So/UlKPDYl2rAW7LH1JbRHGUZ7inxlVL8giPW5oi24LS2WTEYsTzdoeqIl4y+nwHmvpZcfAqACQcjhICrpJPG/RrfW0KnjUFPmvg7UGinrVitzNXyvc4HbYwpiKby1d85iZG9cNDT0ejYBaF8onNOLW76kbDqhXx4HX4657hyxCurJ+YMAV7E7FqwnF7CVgA+FThZChA160oBvv+3UjabXcy7jFRHrEUHQ6Op27AYHZs3Wnv/ZYSRSUjjgwh7BpI2Qvn0Go4PJzCAW6RnXrzJFBnKOL2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ggjmk5fUGkioYbiuHrpgmwF5jPPRaUl0+tSSXX+oN4A=;
 b=hRdjBqm95/N1jQGN0SVE5pEmDSPCaPnP8vvzcCbhonslj5aHSrZHRv66kOjymGymHbqLnuJl+pRkkdfYLM84QUVoAoOY9mbfVaUZoW4EkW5wDSXyYvtXVCCAO9WuUM+1nRY6K8iJJmJ7++Nf/kuOttcddN9av5D9JWyGgCrCwS4cCl2lfSpdlGgGUJzKUvwyIEJKdmsL69p8Gv8jrJYppMPO0w73XkSgh7GnJJ2NAlEuzSI/YroWkVn7YQ3+sofbq3eB/0pIZ0Y++Ecm4ffHeDC4SoJ8NFofLBKXf6/MLCyc69CBLbCjonTnMQyp9ix7/U/sor2pZnnunInJr0Igpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0dbef17c-be73-1d88-cd20-83f3123361bf@suse.com>
Date: Fri, 9 Sep 2022 15:41:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: correct cppcheck-misra make rule
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: b3eade7a-9646-4acf-ae91-08da9268f6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ht6TmMMzNIYI6ufhwTggpjsqWO+0WLOWTRHmuCKzuE4487ATTFp+SBHOwW8bUm9HMI4X8mL/Dz3lXv86TOe1K8OeOWOFR4rIVRzBhEh/csyxawyPxqp9LIJA1DPDFcGY40Ul4C3JPWk4SwJLdXGHkv2xH3z3HGwfypBwSG866NUQ+BON1+kwYuNiCdJuQqEqM/F0aRPcGxtjErv7inpzR5foDjZ/i9wcToA/ZmoEDiZ/J6VDpVjIgU2EegwtigBJuc9cilCxdfW07LIK7G2QepM4Kfkqrae84gLHGLtWuhYL//RSk46VfWxMKno9mTl73DsSUnSPY7YE7E6z3OcVAMQTHS+U1JcpefjVsWzmFB+QzjZiMeBcXN+hBOLOH7QdPyYpu0y63tULFZBaBmRrXuEmvfq1aKRDhKDU3c17KlglI2DMk1EZ+K01L7BFclNPBjZxuKZ8lNszvsXkl0DP+MMOKKi36/y2STr2IsvCuX+B5Vea10hVU0MtyziP2R/ABcmP8zsPE4fqG1KQfXEBxjLZEmjFjfH5fYNkLK1AJ9HJpwBq4AvoDz3LGZFeeChmWDCizkYIECGopngL31OhsWCmCQmHxXG8lhkt81ZXqvxXR0wcAjfWrA4sZgV3LvvVPL10jIJ+oFHx+QEluN23sQzglsmyceuBtxh/Ig2VSNvWpMOrhPOeDGiJltRryHEhAwHuwWBqtQLrScU0TeB+AiVMxP0PXBhzlsD0cn39MamiQlcNKsHJr2Ccw7URbyFTMWn6SclOMbFT1LMksT0NMIv9GzM1vWNAL0lfsaR+5s0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(136003)(396003)(346002)(4326008)(31686004)(6916009)(86362001)(54906003)(36756003)(31696002)(316002)(2906002)(38100700002)(8676002)(8936002)(5660300002)(66946007)(66556008)(83380400001)(66476007)(41300700001)(2616005)(186003)(6666004)(6512007)(6506007)(6486002)(478600001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dStaYlZ2SGs2aENjUnVsUHdJaXFld2FLUTRkY2lZQzFVTXM1em1PaVd6USsy?=
 =?utf-8?B?OUZEWGZhNGNGOWNkbHY4RmRrbmtTclIwd3lIejVHaHRHMlhMNUltK1NkS3Bw?=
 =?utf-8?B?cVI4a1NvVVI1YzJRV0VvWm9TNHpPUnQ3Mlh2ZUhZTEpQV3RKWjRCK3FLNnJv?=
 =?utf-8?B?V0hPTHNlYmZ4dUl0ejlHdVBoVmJmMExZc1Qya1FGRGl5b005cmsyN2ZYb1Fx?=
 =?utf-8?B?RTFRK3ZWbmR6cmNEWWtCVUF6cFBKTUhVNXZuekI3N3F6dmNRVmNFUFU0WTlH?=
 =?utf-8?B?aHpMSG1ONkFCY3QwbFdRdlRRdnNqeFI5emFtWU8xM1FaUkdrcXVOdnl5Qmtp?=
 =?utf-8?B?Z2VCV2FsQWkvcHJMbHFNRkV0cFlKdno3UzNSNDR3dWFiZ0RFaklBaEl6WXNo?=
 =?utf-8?B?bWZoMXpFR1ZWZmhmMC8zL3ZJeHNHRWZNdE13NE9PRnhHWjBpV3ljUXlhd1Vu?=
 =?utf-8?B?aFJseDVRZ2o4K0VYVndVczQveXgxYUlhM3lzZnlzRDhpa0N2cWJITXFLNjgx?=
 =?utf-8?B?aGlrMDFyZVFsQm1ERjA1VzdkWWtZbkhkZzlIdHpua3VjbmZZKzFtWTFMS0gx?=
 =?utf-8?B?akp0RlBTN3ZsODRHMVhmMXY0UlFGQzM3bFRLTU1DQVVkaVo1RkFEYm52cDY3?=
 =?utf-8?B?UHRRTGdLUHc5czBMWlB1Rkx1eVorTkVUN1N2NDJ5SFovUkNzYzJmM2FKWTB4?=
 =?utf-8?B?aDd6MWF4OUxNN00xS0IwSnNLRmp2ZWE1L0Z5M01aZzl5c1pScHpvTXR2Ukww?=
 =?utf-8?B?Y2srUVhJNWRETi9DVFlhdTZDQ0FIL2ZJcEkrMVIxckRLc3RjcXArUlRUVHlz?=
 =?utf-8?B?M2wvdFljOW1GSGVOK1VvdGMxMTFsS0NEcFBudVhwd1BqYVpSdWNSUkFqY3F4?=
 =?utf-8?B?Uy9RL0FkUEc3ckFmK0N6c1E4UkxpTGZZMnp1TkgxQlpZUkEwLzRtdmFJTFRT?=
 =?utf-8?B?RjM3amUvelo3R3RHRkdYWDd2YjZ3aDNoVkhWTWIxVG1QTitLQlVSVjhQeE9H?=
 =?utf-8?B?YmV0UWNGcjNWYzNjSnFrc2RJRVVMbTJRUkNxSkd1MDE3Z0NrdkJVbzVWaXZr?=
 =?utf-8?B?ODhDM2FnWVcvUnMzTnAxdEg0WWJDcXVtNkc1eTVMWFZmQ25XMnNsb1pmSjBZ?=
 =?utf-8?B?aVVLMTBSVUVqc3BiS2pYZ1lkaUdTQlRnNzUrNGFQZjE3ZGsvTFNMTmgyWTlB?=
 =?utf-8?B?aEVteDRkUlVJREhzd0xBVjFiOURmdFRxY0Q1d3g0UnU2MUhHcWRuajBuQ29t?=
 =?utf-8?B?dkRlb2xGbWxwRVlMK0xkSSt3U0JMTmxVYURkdkloeURTaFNtc015MWpGMW04?=
 =?utf-8?B?enI4anFMYkhxQ1h0SHduSEs4RHdIMDBtRGhPcU55bTBPV3o1Um5MR2dMZndm?=
 =?utf-8?B?WWZmb2d0TElxNGR3Qmh0M0NBYUwxWWd0Vlp0UVJBTHB6U0lQNW5UN0dKNWlz?=
 =?utf-8?B?QVFvNUVMZDF6RVhOVHY1aWZNUWtqSTZqa2dUSnh5NG0zQ0s5VUdtMlJiNGVw?=
 =?utf-8?B?K1BOUERzdyt5eVZaZ2J5NldjWDBQY01WZzhoU015L3VmUzZDdUpicTVQeGRB?=
 =?utf-8?B?UEpWRXphdVhMMGREMVFEL2JtYk9LZnhOMituV3h1TmhYL0FrQ0hjQTJobVVG?=
 =?utf-8?B?YS9nYnBPcVFYY2d3NXZIdGtobjFjdFF6S0xqNmo3NE53aS8wYVNKYkVCY1VM?=
 =?utf-8?B?cDVJY1lYU2dYdkJQMm1TSkgzbXFMK3BiTVF0cGFFSndYZVAxK3lWWUkzTWZ1?=
 =?utf-8?B?WHBKV3VKcjB2UlNrMDRmcjVSL0VwZ3BOSnNYTEFsbU9CM0sybHBPRHJWSzd4?=
 =?utf-8?B?aUF1SFg1cHR4VE9ISnM5S2JEeTR4VFEvcEYzd21WVUtXdXZGRDZLNmVtcllq?=
 =?utf-8?B?azY2QWFkblB4RURwUVZ4eUNRQTZ4YjVKVTlsK3MxcllxSXpGS05JaDJjZWQr?=
 =?utf-8?B?MkxiSVJZdVBTdCsvZzgrMDBjR0t5RnJURm9ScXNOb2NBa1ZEbmtkVzVDN0J5?=
 =?utf-8?B?c2c1bS9teFVNRWhReWU3YytoRlN2OTNaWGVIbWZKeElEcmZrdkFUSzBlSXdu?=
 =?utf-8?B?UFNMa2xrV1hTZmJEVUppMWozdFFxQzlqOFQybnh2Zmd6cFBXVDRJeW5mcmpE?=
 =?utf-8?Q?ATIQ54F2x56LAtdjAXkhjotBI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3eade7a-9646-4acf-ae91-08da9268f6a3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 13:41:14.0241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25ln3iXyfFwaz4A1EIT9S4uIZKo8B36sDENtxQgj2IJO0swDCHT9/pLUfUr6ApjrfUKmgLRTIFdMuB8wVooFpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5716

It has been bothering me for a while that I made a bad suggestion during
review: Having cppcheck-misra.json depend on cppcheck-misra.txt does not
properly address the multiple targets problem. If cppcheck-misra.json
is deleted from the build tree but cppcheck-misra.txt is still there,
nothing will re-generate cppcheck-misra.json.

With GNU make 4.3 or newer we could use the &: grouped target separator,
but since we support older make as well we need to use some other
mechanism. Convert the rule to a pattern one (with "cppcheck"
arbitrarily chosen as the stem), thus making known to make that both
files are created by a single command invocation. Since, as a result,
the JSON file is now "intermediate" from make's perspective, prevent it
being deleted again by making it a prereq of .PRECIOUS.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I've not been able to spot where / how cppcheck-misra.txt is used. If
it's indeed unused, a perhaps better alternative would be to convert the
original rule to specify cppcheck-misra.json as (the only) target. One
might then even consider using "-o /dev/null" instead of producing an
unused *.txt file.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -746,11 +746,9 @@ cppcheck-version:
 # documentation file. Also generate a json file with the right arguments for
 # cppcheck in json format including the list of rules to ignore.
 #
-cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
-	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $@ -j $(@:.txt=.json)
-
-# convert_misra_doc is generating both files.
-cppcheck-misra.json: cppcheck-misra.txt
+.PRECIOUS: %-misra.json
+%-misra.txt %-misra.json: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
+	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $*-misra.txt -j $*-misra.json
 
 # Put this in generated headers this way it is cleaned by include/Makefile
 $(objtree)/include/generated/compiler-def.h:

