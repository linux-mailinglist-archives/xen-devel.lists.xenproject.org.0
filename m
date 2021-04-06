Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0B354DCE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 09:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105638.202050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTg4e-0007S0-4k; Tue, 06 Apr 2021 07:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105638.202050; Tue, 06 Apr 2021 07:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTg4e-0007Rd-18; Tue, 06 Apr 2021 07:24:32 +0000
Received: by outflank-mailman (input) for mailman id 105638;
 Tue, 06 Apr 2021 07:24:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgwS=JD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lTg4c-0007RY-TQ
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 07:24:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9facefb6-ad17-4bbb-a395-e5931d064ab2;
 Tue, 06 Apr 2021 07:24:29 +0000 (UTC)
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
X-Inumbo-ID: 9facefb6-ad17-4bbb-a395-e5931d064ab2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617693869;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Dic6IK8QayCg/s6bayaGiGRZd2WYKi2gNIf366dtmlU=;
  b=hUP/6W5pkznEm9r89v6Q4iRlV4dutSzF4Qcpigz9U/lr3n35cr6hlifT
   57lMWXyVFVbExU6f+y3pOKBA2V7T79CoMStors/RV+ski3N8jmDVMD/WR
   +no5Sg2LlAvJ+5JV2GSObSxfs94nYZGgK69sVoF6J8PPr4Y9m/pjpbgIH
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IUXWMJwBvs8i2u+9Fn5+w1/8ZuIbJ37i+TBlzbuDT5meXP8k0oEqWkyzvL4Pdadal7YLEVetS9
 skecLr5rAk0bzbxPEbznn6CVCL+rn1/etWD965joPzemRuEzdEkiuLo2XATz4fDXjt0I0lAL0J
 EpOETdhwpJtRPuvgw86Otn5LKDnra+daDt6urBGJWGJvtUkzYrUK4UNKMe0gjy632R3CPzNkgG
 9z5olP3DMv8pg90ccfxbGtcp2eCw/4oBFQc18lWAlbrxUks9RGBQ7KQJx0An89YcaSkrMUhEx+
 lBw=
X-SBRS: 5.2
X-MesageID: 41322658
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3oZioK2rNy3iIrFc+YeymwqjBQ93eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFnNJ1/Z
 xLN5JzANiYNzNHpO7x6gWgDpIEyN6I7KiniY7lvgxQZCtBApsQjDtRIACdD0FwWU1iDZ02CJ
 KT6qN81kCdUF4Qadm2AWRAYvjbq7Tw5d/bSDMlJzpi0gmBiju09KX3eiL14j4yWy5CqI1Sll
 TtvBf+4syY0s2T6hiZ7GPL6oQTpd2J8Ko6OOWpquw4bgrhkRypYoMJYczPgBkQrPu04Fgn1P
 ngyi1QWfhb0H/acmGrrRaF4WCJv1gTwkTvxlOCjXzordaRfkNCN+N6mYlbfhHFgnBQ3u1U7a
 NR02qV87pRAB/Q9R6Ng+TgahBwmkK45UcliO4Y5kYvNLc2Vbk5l+wi1XIQNK1FMDPx6YghHu
 UrJtrb/uxqfVSTaG2clnVzwfS3N05DUCuucwwngIi4wjJWlHd2ww8z38oEhEoN85o7Vt1t+/
 nECKJ1j7tDJ/VmLJ5VNaMke4+aG2bNSRXDPCa5OlL8DpwKPHrLttrR7Kgq4vqpPLgF1oE7lp
 iEcF4wjx9zR2veTem1mLFb+BHER2uwGR73zNtF2pR/srrgALXxNymOT00vjtugr/0TDtazYY
 fwBLtmR9vYaUf+E4dA2APzH7NIL2MFbcETstEnH1KCy/i7b7HCh6j+SrL+NbDtGTErVifUGX
 0YRgX+I81G8wSuUn/8ix7BRmP1diXEjNZNOZmf29JW5JkGN4VKvARQo0++/Nu3JTpLtbFzel
 B/LrPhmqayvnK34m7M8mVsNnNmfwVoyYSld0kPiR4BMkvyf7pGkc6YY3pu0HyOIQI6U9nbCx
 dFp1N8+bu+KpuZwSxKMaPhDkuqy18o4F6aRZYVnaOOofr/cpQjF5A8RehaDgPQDSF4ng5stU
 ZOYAIJXVXkCzvrkKmp5aZkQt33Rp1ZukOLKdQRgW/DvU+czPtfO0czbnqLa4qrpioAAxBTnU
 Z89qcDhqHoo0fSFUIPxMIiMFNNb2yLBqlhFwrtXvQappniZBxwQWCWhTaTlhE0fS7w+18Pg3
 H6RBfkBs3jEx5TvGtV3b3t904xfmKBf1hoYnQ/qoFlE3/a00wDmtOjd+633i+JcV0JzvsGPD
 ytW0phHip+g9S23gWSgjCMCDEvwYgvJPXUCN0YAvju82LoLI2DjqcdGfBIuJ5jKdD1q+cOFe
 aSYRWcIj+9C+Qn3WWu1z4YETgxrHkvivXz3hL5qGC+wX4kGPLXZE18WKtzGaDp00H0A/KTlJ
 lph9M8uuW9dm33d96d0KnSKzpOMAnar2K6R/whwKok954apf92Bd3WQDHI3HZI0FElIMD4mF
 gXTa577LrCU7UfCfA6amZc5B4khd6PJEwkvkjqGec4Z0gqlGKeMNWT4bbEwIBfd3GptU/1Ix
 2Y/CJc9fueAHfG2r4eFq4qIWNZLEI7829v+eued4vWTAWmHtszjGaSIzu4avtaTqPABLAb6h
 B96NuMl/WMdyX51BvL1AELVZ5m4iKiW4eqHAmIGeRU6NS0NlSHn7uy7KeI/UbKYCr+b15dmJ
 ZMekMRZNlSkzUujIU41S6pV6z8y3hV4Gd28HVgjV7i2o+v/WfdEwVHKGTi8+trYQU=
X-IronPort-AV: E=Sophos;i="5.81,308,1610427600"; 
   d="scan'208";a="41322658"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DECKNk2CxHQZ3LUFQ8v+gMV/JTTiJ+PmmZFMb5hByvUOtZFfOWLea2CBcUMFA/8fUsSmXhbnFx/x/d/1LuTOuT1q78viHnI8xhmfpeLw+CRdRmu50JeacL3HG0Cn9HyufYqjgtYKO9KMQfWZtuTNQI/Fbpuf51Qu3RrrQ8SIPaiidhrrt3TL3MULcOwORPWHODeUeghkQwttbs98fEBRsWEcxNAaetUPs+rrsIfU4fDwhAbUd/eJ16Ual1jkQ6CyLfzTBKEjXTauCSg5M7ZpMJ50WQLz7aAyDtYmxunH2FD8xw4qibjyWzIJ3UjkpqoXolEcWIkW0bTtpUvIpEeTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaSM8NYnKk7QGM96Sa85FsEJn1s/VgUk15oZYdXJ8w0=;
 b=KVahHK7Z2oDdD2kVgsJOwF5Uw0uo7foWCVWmb+700f2sWWPWYg5yeV7JY2CA+xHXiT4JLoMQCQj/usM1Yx9YARvDblRxwyxlcy0DEnp1De6KWi3GygOcTCKZN9qgpA8RJq2jUQaVyivdaagWp6EZxdJpXD8+XN5UQWbdhgijEtqAJZZGqlZbdZoJQUzUEKz8W7Mf5ryveBD79xAe7yjq/I+/RV6yTG/kbtArT6xNtoHKF4R9CLUByEv7s22U6pyjQ4sAPOBd4Tff620bACDGbRfc31zxfMcLv4navBnr6/d2WSzMXFbtOsydrDBZ3CcOjKM3wf/sQ510N3HkOGhrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaSM8NYnKk7QGM96Sa85FsEJn1s/VgUk15oZYdXJ8w0=;
 b=CWgZfduCy8GQ6AdBFt+1AwWQbhp2mqHnm7OLUAVw/TWkJ+KktxR5IFbRg25pfv7sjlccXJstoDe2MBcWSAtJ/3iAMxvdXT7rXYRtIPa5C6tG/UsaUapMrbgTzEPUlmoyNvFYe9iBCbhiltuvcz1OWCuppP+CpZkH/DVZd1FTIJs=
Date: Tue, 6 Apr 2021 09:24:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, "Tim
 Deegan" <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH 03/14] xen/x86: shadow: The return type of
 sh_audit_flags() should be const
Message-ID: <YGwMojJV0gCFa4fd@Air-de-Roger>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-4-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210405155713.29754-4-julien@xen.org>
X-ClientProxiedBy: MRXP264CA0005.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fbbd864-2399-4ee4-a4de-08d8f8cd0176
X-MS-TrafficTypeDiagnostic: DM4PR03MB5967:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5967FFEE2174396EA0991A7C8F769@DM4PR03MB5967.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6FjElxC0VJ8bVo+oQQodvDvcd/6JI/dJM5hzXZoKDuEW6e4YjrKKvc9s79KtDCR+nHBaZK8q1XEM4Ue+CJlYEamRC7aMEqeQVTv+Mwj9Y+H2+NhwliDOIWoVRZYH2EthxJ3QxBZJPMvmsJ605yB+P2z3HWUO4uuw5NIt1AJLO1+Skpw1i0iSoGj+aRyhKYyaY3lzM+2IMAH3+rWmzDGVrlKf8KqHjcTnB83xBF9mPBEFnxKLIZhgI2xwF9s/BMIauxQKAC6RYu2ud0ikX1OZON5EN9urZRD9xh0N1BhFGZmWD2JRgE6jYOtOzghKDrU19PrbUaN7PzeOTD9VzuZVHaPG59tladNpgi8yrvEbd0/vxKDy3UUqWQMU2bhGxMGECyTV9AIY/hYc68caNPgvm3MyJBgHMi0UGBO5jisIuAJNFEbyKilZUioL5vBOhuMvx6oIYwsSTH+KXjFx2AJR4oiYsuXvCoVTA8nugEpKnxbRdfa4bYre0rOcstM6zrCrFMXRj46UiRqSGxJYEeTNATVbZ0Q/jtwFIwWzn1d1JoMW2YUbI9aIGEZmj3OEXPf9ZLIAcijpNYuejt8SxXSrxSkCEoiMSEUHkb3esaLFwO5mgATP9LhAq8PbNYKrM99qsqlLVnbyXaYhSCficrG8aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(346002)(396003)(39860400002)(136003)(6916009)(26005)(6666004)(6496006)(478600001)(66556008)(66476007)(2906002)(186003)(66946007)(54906003)(316002)(4744005)(33716001)(86362001)(85182001)(16526019)(8936002)(956004)(8676002)(38100700001)(5660300002)(4326008)(9686003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wit2eEZWVHR1ZGZIbU4zSVlmdWlIQk1ZM1JSNk5MVnhwbHFNNFdHUCtyL2Rx?=
 =?utf-8?B?SDFTbGxheWtHZktkckJxdVFRQ1NvTjZQRlhndXBVU0dORUVsMEo1Y014d2lZ?=
 =?utf-8?B?eGtveEJZSUFzdi9Nb3ZUVFI1SW9lbmNORjhCTVFZRDg4UG5yQW5tN3pUNzNY?=
 =?utf-8?B?bDNQY3BuM0pka2x1bGhBZFpVNVNFVnd1QlF2eDFNTFhNMW9EdFpEZ29LNWMx?=
 =?utf-8?B?UURwL0IwYVdzOTJUeFp4SWo1TDhyY0ZXWHpCckgvMkx0T21za2RHVDBZWjBV?=
 =?utf-8?B?Z25HWXB1OWxmQzJSZHBRZ0JuaHFPVmI4NTVMVXRmUFQ2Z1RFWERNVlFZK1lI?=
 =?utf-8?B?Z2d1WVRTYmdtS1hLNnFhdU9zbTFVNUFkRGQ5b2FoN0UzbHVRWDNCc3dJNEQx?=
 =?utf-8?B?Z0pDS2RuQmdseFloVGdoWmp3NG9pdXJhaVZSOGVDWkJpalFaZGYycjZlWGpU?=
 =?utf-8?B?TTZ6K1ZMSWZoTzZHeUZpRU92T3hydTl0VkoxKzJhSE83SXJxUzRUWUpTd25m?=
 =?utf-8?B?eWVZVmp4TEFNZnNyMFFoMklyaEJnOXNhUzRncVVIeDFaV3pVbitzZ2Nza0ZM?=
 =?utf-8?B?aW1jTFhCTytKbTVxTU8xckZMRG1SVXdoZ0x4S3hlckNOTjVjV3hFRnVrdlFG?=
 =?utf-8?B?RWEySlVpd0xWSWc1NlZnMndPUC9QbkRKL3ZVYXUyOFZjWjQ1YlRyQ1FmV3l6?=
 =?utf-8?B?MzluWjEyMERhNG10bm9hQUtza055YUZKWXpaTXlqb1Y4S0cyNEV4eE5aU1lr?=
 =?utf-8?B?NndIaVA5QVVrUUdnK2hHWCtKYURyOEtwSFFraXk0VzVrNmJQd1daNzcxRGx4?=
 =?utf-8?B?dFY5ZFZZNVpNRlMrbTQ2dGpieXIxeVBmM2tzOU9uTnd0RDVvTGVublN0TnA5?=
 =?utf-8?B?dmgwck9UN3g5VGl5blZzR1NGZVZqdytrZWlyZ2FZSU4rb0pNdVdKQ1d3aGdn?=
 =?utf-8?B?MS9uM2pCS3ZSdUtINGQ5SlluZkhKZlZaVWgzVWh6c3VYUDE0bmhMN3gvZ1Vj?=
 =?utf-8?B?dTE5ZTJycDVtaHRZaWZpdVZrN0UyVnpyRzdoQTdTT1hDc1lKSkxZQ0lJL0ZD?=
 =?utf-8?B?ZkYycUVzejhlaDlZaDBJUUl3c0RGbzNxUmJsTFJJbTdUak13TmpOdlpmQjJU?=
 =?utf-8?B?ZzhhZm1lMlJZTDdPM2l0aEVQaFpJZG9OSXczNVlxaGZFOVQ1ZjE4RHU2cWw4?=
 =?utf-8?B?Q2lOcDFaUmg5bHpNcVQ5eFcwOUlReDVLRkZ1SEwzMndCV0NqTHA0K3N6Tjdi?=
 =?utf-8?B?cTR3WnFVL09DZUFUa1FwVFhHYmZoWjc0SFIvVW5uNWlSbkQrcjlXY0hobzJK?=
 =?utf-8?B?ZGhxMnR3cDNBa0U1c2pMcVpWVklPdzFlaHBzaVhHZ0RhS0p2cTVHajYxL09y?=
 =?utf-8?B?QSt6b1JtM0Z1Unk0eWhMS3o2WXptYUlyOXpPOUk0bzZ4bmxZd2xXQzUwcHBp?=
 =?utf-8?B?SUtXWGQwMHlROWVQR0hlQ3YyeG11ZVpzT0lwTVh5UVNYMXg2V0QwRkZMZG5x?=
 =?utf-8?B?Z2c4bWx2bGZObUNyVlRJbmVTb2lKVjdoeVNDL3dBZ1JrOHFoK3AzY05BdVYw?=
 =?utf-8?B?bnBwZ0xiWnV3OHZrZ3Bmb21vTjZMbFJ6T0JTbzQwam5mZ1FlNnF1REJZWE4r?=
 =?utf-8?B?dldDY2oyK1lyWTNPclVFV2VIV2s0Yy9EYkVzSGlkSUpkUDdPRGhZSHc2VVAw?=
 =?utf-8?B?QmhKWEZsaWRQSnBoNU5aZHJOeGRVdld3RjdHaDU2a1RvZndyNnpDb3RKU2Fl?=
 =?utf-8?Q?DsSXOO7cnCf4bufh3rb7KswbvEJNmmS8Ft7NB2+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbbd864-2399-4ee4-a4de-08d8f8cd0176
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 07:24:25.0671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+cTUxA/aScMAFU57zJRaVJ1GOuo9zMhOZTAgAU2m8EDGmF+CuDMIOaZPC5S1YEL9R1sebkBAvwWIVxdz78Y+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5967
X-OriginatorOrg: citrix.com

On Mon, Apr 05, 2021 at 04:57:02PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The function sh_audit_flags() is returning pointer to literal strings.
> They should not be modified, so the return is now const and this is
> propagated to the callers.
> 
> Take the opportunity to fix the coding style in the declaration of
> sh_audit_flags.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

While doing the cleanup I think you could narrow the scope of the 's'
variables also, but doesn't need to be part of this patch:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

