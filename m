Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24445802E69
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:20:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646648.1009115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA57v-0000Ps-Lb; Mon, 04 Dec 2023 09:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646648.1009115; Mon, 04 Dec 2023 09:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA57v-0000N9-Ir; Mon, 04 Dec 2023 09:20:31 +0000
Received: by outflank-mailman (input) for mailman id 646648;
 Mon, 04 Dec 2023 09:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwQq=HP=bounce.vates.tech=bounce-md_30504962.656d99da.v1-7fbc7c9568744c279cbc27da4f4fa45e@srs-se1.protection.inumbo.net>)
 id 1rA57t-0000My-No
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:20:29 +0000
Received: from mail134-25.atl141.mandrillapp.com
 (mail134-25.atl141.mandrillapp.com [198.2.134.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c7804f8-9286-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 10:20:27 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-25.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4SkJ6f3CgXz4f3k1y
 for <xen-devel@lists.xenproject.org>; Mon,  4 Dec 2023 09:20:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7fbc7c9568744c279cbc27da4f4fa45e; Mon, 04 Dec 2023 09:20:26 +0000
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
X-Inumbo-ID: 5c7804f8-9286-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1701681626; x=1701942126; i=charles.schulz@vates.fr;
	bh=5YwxzpGjAVX6SqE8fsMcUi7RD16Vu7jGvbwrExzvB5E=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:CC:Date:Subject:From;
	b=Gjb+naD+fOOClieVbvN5ZsnCsUMFvVBbMIhOcsa5d3m4UrL1H1iLH8Z7zPD7Kdb/7
	 BF2qXpaTAh9dD6RgWN68hcwVWuahGLr9H8133L7H4I0eHocagpO/PPVNwOvXRy4bVm
	 xuiKEFeGR0K9qiYjq76mh9AUkL1d3XDhJQd2ciDE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1701681626; h=from :
 subject : to : cc : message-id : date : mime-version : content-type :
 from : x-mandrill-user : list-unsubscribe;
 bh=5YwxzpGjAVX6SqE8fsMcUi7RD16Vu7jGvbwrExzvB5E=;
 b=kG4Wvyui203CKn7Neu4xFDM7tQtLDeE09cKugmvE2Yu7xTscIHqGrhav4VyspMLU+1Pne
 7yiB9G94j4CSs7/Q5hC2xx/j6hYBDzThlt5/QnXU4z3/Hovsl3Ep7kzVcuhD3+hFfy2fn8E
 QOCEQTx84qpKd2MApPNXqhb1eOPk9YM=
From: "Charles-H. Schulz" <charles.schulz@vates.fr>
Subject: =?utf-8?Q?Improving=20conflict=20resolution=20inside=20the=20Xen=20Project?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1701681623880
To: xen-devel@lists.xenproject.org
Cc: 
Message-Id: <87plzmcoj5.fsf@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7fbc7c9568744c279cbc27da4f4fa45e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20231204:md
Date: Mon, 04 Dec 2023 09:20:26 +0000
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="_av-myVoInnGpJ6ZbSELTrdJEA"

--_av-myVoInnGpJ6ZbSELTrdJEA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

Following up on the discussions on the use of certain terms and the way to
handle disagreements that ultimately lead to conflicts, I would like to
suggest certain mecanisms to more effectively handle such conflicts. This
does not mean I'm against any informal or formal voting - I think it was the
right thing to do at the right time. But looking forward we need to handle
conflicts resolution in a way that inflicts the minimum possible tension and
paralysis on the code contributions and bug fixing.

This means that we need to move to a model that's already quite common
in other projects, namely, a model where conflicts resolution is dealt with
processes implemented by one of the more or less formal committees chartered
or existing in the community governance.

What this would imply: in the absence of a more complex governance within the
Xen Project I suggest the Advisory Board be put in charge of conflicts
resolution. With a simple process that I (and others hopefully) will clarify
soon, the Advisory Board would within a specific timeframe collect and
analyze the conflict either on its own or called upon by one or more
community members. It could effectively talk in more detail and off lists to
the relevant persons and then suggest a way out of the conflict.

Ideally - it's Monday and Christmas is not far so let's dream a bit -  this
would lift the burden of the conflict management away from the development
list and allow it to be focused on development. The Advisory Board should in
these cases work in harmony with the informally proposed Technical Advisoy
Board in order to ensure its decisions are not just the consensus of its own
members but are well understood throughout the project.

Hope this helps,
-- 
Charles-H. Schulz
Vates SAS.


--_av-myVoInnGpJ6ZbSELTrdJEA
Content-Type: application/pgp-signature
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSk1CQUVCQ0FBMkZp
RUVCcE15NjBzdVV4LzhhVjUxZnFKcldiZVl0T01GQW1WdG1jNFlIR05vWVhK
c1pYTXUKYzJOb2RXeDZRSFpoZEdWekxtWnlBQW9KRUg2aWExbTNtTFRqOUFB
UC8yeVdQTEZvRFUvYzdFM21aYURQMW9oUApwODV4VDUrYzRKeWFma3VycHF3
MndhRlNGTllRaUgzTzV5QXkxS0VDZXRJSStxTitnMzFvTmtScWl3bVE1M20z
CktGRzZkQTJQUjdLakJMTTZ3RkF5ZGl5R3hGSmJ2STcva2hLWHRaYlJGQXhK
NVl0NWRkdEVLTys3b0tjdzFIOUMKS0R0MTZhNlM5U0pDc1dJMHhZMDdwNWU4
TDNvZitleHB1SEIreHRRMG1JUTZBdFZadUxycThLQVV4YUcrbzFrKwpGUURB
L0FJVTViWDRPYThyS0Z6RDFTTlBmWVZEY3BCd2h1a3NZbmNKaWdQYmZ2Mmdi
eWtpWmlPdXM1RGdlMVR6Ck9XaEgvRGdYUVVlUDFSSWpEeGFSWndxT25HMzFE
NEU4VnNNVjFHZ01RYnRxTzNRaTI0bVBXeDBQbjN3Q2xRZEQKVVBobzI1akpu
NVFMN0xsbTRnQkF4QWtoNnUzSXZFenBHMEk2NTJJSE1oMmU1VGxtNEF0YTRP
NE8zbVhFSU8rLwp3Qnh0U2Q3Znd3OXQxU3ZFa05kR0paZGxTc2xGeEYwTEp1
aFBLVGJ3T0hMcDhHNU96LzYrTmhvWDViZXFFUm9GCnlHdGQ1VnprY3V4TWFD
VXhNSTI2UWM2WHBqcW9sT29taUNaL0ROb05hRmFsVVpPZFV0NVhSbkpOSTBG
ZjF1a3kKYm9ielpEakkybnplU0xpTzZDNW5CdkxjMHd5amNXeGtQdjBLT3NZ
ZjBnUENYR2FzOVhiZTlTVW53dmdBRzlmSwp2VzQxbjBIOWJHVmJzYWg0Z2Ra
amx2TW5kTUVOUUNxMG9QY0JaSm84OGNvT05RR0JBVmI2RGxpa1pINUJXVWVE
ClhsbWEreFBuWk5oVDdOQ2xab1pJCj1hcUJ5Ci0tLS0tRU5EIFBHUCBTSUdO
QVRVUkUtLS0tLQo=

--_av-myVoInnGpJ6ZbSELTrdJEA--


