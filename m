Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A204C8E2D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281597.480000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3nG-0005VV-Nt; Tue, 01 Mar 2022 14:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281597.480000; Tue, 01 Mar 2022 14:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3nG-0005Te-Jl; Tue, 01 Mar 2022 14:48:02 +0000
Received: by outflank-mailman (input) for mailman id 281597;
 Tue, 01 Mar 2022 14:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP3nF-0005TW-Ai
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:48:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 970bf319-996e-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:48:00 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-ULVi9T2pN8Ce-Q3ftC1Pjg-1; Tue, 01 Mar 2022 15:47:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0401MB2610.eurprd04.prod.outlook.com (2603:10a6:203:3c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 14:47:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:47:57 +0000
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
X-Inumbo-ID: 970bf319-996e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646146080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQ4jdTWxlZGApeChgMmKKjO8QRrHTIp03uBQQXZSq8M=;
	b=NLIgR1dK+cqWixTvpV60d9KnMvV7WhEyW91bfnCPj4CWb0jps4lu4nsecAFq5oEiKxM+gy
	qg9uQYnaPi3lysb+4XaeGgIjbwHLsYRGkIGlch6TZPb0feXhn/WKbPEGliodnTW2ReFHHR
	fte8V5RPaEL3Asyw4FPPgmlDV0wH2x8=
X-MC-Unique: ULVi9T2pN8Ce-Q3ftC1Pjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrD9zzenl5+1NjBkiJMigWlPcPtH2MiG2GQSAym8C0ACz+MMFPCLtfYSTtWfqqXgHHwKrRswlJIFMumTCPZ+596Dzt1NSfBLuiAXUIYXCzeZf4u92e6cSO951KVHWAf97XHrkrmxW2guwQowEaaofC/uZufzgSsTEWVNe23z8nDGDdmB/u8LDWDZ4j+9HpEneMc+kWfqg1c2vbH3fBenWM0FBZs0G+niMxj7sx3wcB2Dk2xZIeAOnM4ksdqvOfMhVeMtKWmcI9pgjkn+1b/oLyr3EHdfm4yxK8Q0W8NtXHJepx+1c43Yja9PQi4OWvnWXHxwumzf6Dz2f6RvUUwbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGJRUDfOJhcjOsQNVB6rBpzXdwkRo0EE1W5f+8ArDks=;
 b=ZCfp8o0SoDZDokIcdHGiiLm/0cw3bgUwVuCTuh07715YQlT7me0s3xTsPGhRajnNEXHP7VSrKD6ejQbnryXtK46vqejvEqNy6lW0TAOK08aDy9TQWFOwlXDQJ77A4g2PPSqnb/wst3OMCtxbBipywChkmq90XJZJjnABpxnnCRJeqIq9+zzh97riLHkwKPn5HGX2ERufoIfBHvNDMFzdOJyXzSN7XShxBYcM0oigN950de2BsbX6VyB/15VpRw1zea25zfOnAyxM68H6Ut4JB1E0qkF4U7Eoub1j8YOqizkxB6XrB+GU/vRuIEhj54IMIau8MV1uvPyeHtaDUyUBvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee9107c0-38aa-967d-ed12-e6b52c3fe31c@suse.com>
Date: Tue, 1 Mar 2022 15:47:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] x86/time: add CF-clobber annotations
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <61bbf544-74ac-b698-425a-d1db80acab43@suse.com>
 <20185a89-0a2b-6bbd-5484-31b6582ed200@citrix.com>
 <40ce913e-4388-2d2f-45e3-e725a927da92@suse.com>
 <ae77b805-b513-7aa7-ece0-c3c7dbf662c1@citrix.com>
 <bbc32813-74a2-f5c3-d616-e5fcdeffcd10@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bbc32813-74a2-f5c3-d616-e5fcdeffcd10@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0004.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eea43e0-1c9f-494b-675e-08d9fb927979
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2610:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB26100E62C0211CCE9AAAE888B3029@AM5PR0401MB2610.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nraxtAx35rbBRA7qusffwG1n+saj5gf15Fs6PEPzdT0CmEzRz2/Xq1dYDoxl4mmyRm/yJ3Ynv4SewJyMSv5XtOPDd9KZPJOtPNkEPhmnGcueAyqpgRb2TH2f97iun/NIruLHTI5M1GRuR4gxddAW6oE4n1VX5diNdjM09HLzbWmZ1ECN9asf7v0biRMUmQFEgprznPtxxyTFiUzz8G6ayRXAbujDrJwyef4b1gXcnuJ/WqKo+GhkfsU6Y7sVmR8j0mv3uS2A3e9KL7eKFDP1ZVNg8LWm9LhsvihPmWm/BjH4oZMU3ZhUBCxjN7CS8KPR5Ji20WLz2fGWklrcUdfhba/mx69ji/6feXltLPPaZG8Y3Cte9c44hJIPV8JRblw/wSOdsvDI7S0gVgC2uff7lr3L9ipHdCtUlkOBPVcjeG3mYWru2M4SSd36rRwSnzDwE1xm4LuoWRAeLpVGSPGS05JXr1K04SoASDh3jYx3EYNFd9IfOgcVDRdO9Nikc0aGIkBvKb/PGp/wRbli4sS4yZxGvjt+th5bFJq3cVtk7qq5GH/UwIsocsJMVQHuCmQfDSoRahR/hxdXKjY2vHDuhnbDTZADXIAEPA4fB+QRcPDIQmZXMz+IXkQSDUPXcW/aFuY+0CFX6eOcY972UZMAuvqiy2LortqsDNfDZRsjW3XE0feoDIykHax2LyPw69s5Xj+41z76d4ynpNwwpjJIe8cp0ovcxML4gR/Do6cO2qKBqdMwpot8iV3V3uWcS82j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(36756003)(54906003)(8676002)(2616005)(316002)(66476007)(66946007)(8936002)(508600001)(31696002)(31686004)(6486002)(5660300002)(53546011)(6916009)(2906002)(6506007)(38100700002)(6512007)(83380400001)(86362001)(186003)(26005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fb96YWpMajcUrNnkioKcBPVnQziXJaZNgqsqK/grfDD3YqJ5BoYR7xRAeOkZ?=
 =?us-ascii?Q?AqUvKvW84gOzWrzGGEECTL761TT4FUuXozod+tQh1MHQE7Fk4X6/vM7LkfyE?=
 =?us-ascii?Q?Bgi3TuGsl2VmYbYT2NXvPgYnFZ+zhtXYER9Ev4jtg/8BKSK2n6wQK+2QEObX?=
 =?us-ascii?Q?9zC5dYzfN/83YcUQqtElbBjc6tYlFDNwD2Gt2ghVyPaRZsg9Z+LWgRXWqPQI?=
 =?us-ascii?Q?lJPLSlNtrKe7XlCXCIt7aGfYvAUwvAXqOZ3+fXEUlxEwze5XEq0rqqnuoVEF?=
 =?us-ascii?Q?6mPLUpOoE9k7R1X9ZxdregW38wX9lKXIAZbI6/DCuGP3+BomoaiSFBOVL+84?=
 =?us-ascii?Q?Y15KTKgExuIGImAwnYVK+fMZBbBbQrUnSN1ce7M++/MjWDicE4HJFMqmet+X?=
 =?us-ascii?Q?nPZtLJjfElYVcnL0W1zgUBfbPvl1YcNACPmEGK9zNZHP4Ub5rlAsiT2yF+/5?=
 =?us-ascii?Q?u0Tm487AnZ4dPdMTorCnuHws2XLgilhO0/jDMf5u6R5q92843TyTEnTEBCFp?=
 =?us-ascii?Q?OmfdRizxXTZ2sZ+Y+Vwt+JF5nDkSFLBcbyp/hCVxDO0dCXCBbXXLMqcBYPKZ?=
 =?us-ascii?Q?+PmOJsFAPJ9llvmXu4YxPFNkOIq0eIQUKzuwKl+sfPXIdv3QvaN9dRWojXNc?=
 =?us-ascii?Q?2Bt9h8LTLUrik8tvcKsHEzfSW2Aho3jia5tVXeyWn4BFQRVLo5uq9LoPqFCq?=
 =?us-ascii?Q?5xqKIaaGmQfQ9m7AHglJIf462HHOaT0ZNDYMYwsdBbVjaG0kO9gNHOzFHzvK?=
 =?us-ascii?Q?feOzB2UGYzr3OkDOm50Ux4+NrjvzznFB3lqQ7+k94Fdefl0CqYaIqnS1BNOv?=
 =?us-ascii?Q?UuMfaSB581973Ui/k6craKFbNH1CSDOnXou1VINkHUEKygRiyVScOxcY1Kwq?=
 =?us-ascii?Q?tMaVYWrZOGq6jpSul5U6EZyCigZAUxDn4k6sVG5XmdQuN+OHjcK9AHY/9xF4?=
 =?us-ascii?Q?i/nqHhnBlWwBkRmdndOvF32fS83hEWDQ7SJbWB8yg6vaXORvRhn7nCKPT7pt?=
 =?us-ascii?Q?n+onCQiAqQRlFFJCLxMegkrc383ooMEfHSrIEDVh/j6W4dILCInc940PHCVw?=
 =?us-ascii?Q?bUz5CmwUkam1C4uNfdec7Tyb+RDmWddZbqDnPNMwYzVsRvc/y329gDG7kxrJ?=
 =?us-ascii?Q?amFKCofWPbhRgVRn36O4/WsKxK3tO8Sa/S3cNrA9l6ZA7Aq/ia+wM/7DfY+f?=
 =?us-ascii?Q?mhNk9mJgd9WMJ5xcyHqt+e4bwywFAt8bKQg1wjSBIXfhsAThoe7VoEkcVIWG?=
 =?us-ascii?Q?wcR5tE4Q2+zcD341Sp245hDQsh0gI6T5Jg6cjvhbgXu1Rt/Junelgm3WtGle?=
 =?us-ascii?Q?VQBjysa3FtN82Nb0gQFT8Z1B+ZIlHwzaKtPk/Q0DWqKxyPn2uAj6zQkdIkOS?=
 =?us-ascii?Q?43da5afhIk81gQoYYTdvRYtG3nscNELFC3TGSPUX+zW5hRUxHJeItkfYk6n2?=
 =?us-ascii?Q?CjC3lAHs2rnwmI0wYWlJST8l8oUmC5+5cVhL0qkPEV9M3CTAGTO1CkS2UVSu?=
 =?us-ascii?Q?yXiB1DHF7yBbbyqDn3D0MEuEJT9DXjAnNGxYu6RClMxgrbpTmZ+pCNV/E5Wt?=
 =?us-ascii?Q?kLKTtTiRYXX0FtTjlaiewulHiRcYz7EOsyYW2l9CXHAnFjLK7EYKY/rGXIQg?=
 =?us-ascii?Q?v6qdq/otupLCPaarrIrCCvw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eea43e0-1c9f-494b-675e-08d9fb927979
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:47:57.2838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cw9TCyeTAn86tA9lArOtTqZcojEHby1m9EYi3zmjBBw3bF/Z2ci/QFiAl70WYMvPZMwwp86zBxFYrWo7xseeMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2610

On 01.03.2022 15:35, Andrew Cooper wrote:
> On 01/03/2022 14:24, Andrew Cooper wrote:
>> On 01/03/2022 14:18, Jan Beulich wrote:
>>> On 01.03.2022 14:18, Andrew Cooper wrote:
>>>> On 01/03/2022 11:06, Jan Beulich wrote:
>>>>> With bed9ae54df44 ("x86/time: switch platform timer hooks to altcall"=
)
>>>>> in place we can further arrange for ENDBR removal from the functions =
no
>>>>> longer subject to indirect calls. Note that plt_tsc is left untouched=
,
>>>>> for not holding any pointer eligible for ENDBR removal.
>>>> I'd be tempted to include it, for consistency sake alone.
>>>>
>>>> It is less likely to go wrong in the future if another hook is introdu=
ced.
>>> Can do, sure.
>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> With the commit message, I'm not not certain if this is linked to the
>>>> previous patch.
>>>>
>>>> Overall it looks fine, but I'd like to get clarity on this point.
>>> Converting read_tsc() was discussed (with Roger) earlier on, so I'd
>>> view this as a separate change. As said in reply to your comments on
>>> the 1st patch, how exactly read_tsc() looks like is orthogonal to
>>> the changes here at least as long as it doesn't live in .text.
>> Ok.=C2=A0 Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Actually, you probably want to move plt_src into __ro_after_init along
> with this change.

I'd view this as an independent change. Perhaps it would make for a
better change if we went through and converted from __read_mostly for
a bunch of items all in one go.

Jan


