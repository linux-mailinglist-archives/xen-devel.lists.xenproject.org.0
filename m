Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EAB265FB2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiMS-0006vQ-5E; Fri, 11 Sep 2020 12:41:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGiMQ-0006qe-IF
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:41:02 +0000
X-Inumbo-ID: c6cb94da-1a8c-4698-b869-f9dd9ee092a4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6cb94da-1a8c-4698-b869-f9dd9ee092a4;
 Fri, 11 Sep 2020 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pY3fjy1kW4dEaaeHdIdYk6Yk6eEyrBmlLZyryCF70Go=;
 b=RWhkY695GFPZNjQElWD9Q07pSABfXnzwQHWlIaVZf8c64A3NT4/AdC6d
 ZaqXTJ3SpoZR7iyZJz0KZmoanVAurrIZLZ9xhlgG8a4w6y+xL5nDxWBlV
 vVNurpD5W1tmBF3lRLst/kqdwbaxx5QT0xv4qvOVypc/L7nonwjIBZsY6 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Xf6xs1/ysMfZiCJGgLjUh04akENusDgLSuMcKvBh2K6sakLh5E/bMqAsxzdeTU40281Uxrsz05
 L0/+Jnrppy2ld++U+4IWIpLr+Tp+WOP8PqpuyR5xAxxG78XWMaERrwiwoLK+VmgzNXOgxnvOjE
 IUpYu4y94f4MudpaepB9e+EVsrB1cqq5uWQLHFDrVvD505XLh1IjV8APD1HEXAg9RMXMDO8LrX
 uejf1s3AsqC8ZICuvlXqM8pj0Z/XAd6wNIvN/rjtMwBobk2vNlpqz9Y7YI/VVj4LBF9VRdZ0XY
 9mw=
X-SBRS: 2.7
X-MesageID: 26619473
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26619473"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 6/8] Convert communication-practice.md to RST
Date: Fri, 11 Sep 2020 13:40:07 +0100
Message-ID: <20200911124009.3760032-7-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911124009.3760032-1-george.dunlap@citrix.com>
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="true"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Convert title / sections, list formatting, and references as appropriate.

Convert >-based blockquotes to RST-style block quotes.  Apply the
following style manually:

* Each quote should be a separate block quote para

* Quotes should be italicized.  Labels ("BAD:") will be bold.

For the "expressing approval" thing, put it in a "literal" block so
that the colons line up.  Disable syntax highlighting by default.

No textual changes.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 ...practice.md => communication-practice.rst} | 287 +++++++++++-------
 source/conf.py                                |   2 +
 source/index.rst                              |   1 +
 3 files changed, 182 insertions(+), 108 deletions(-)
 rename source/{communication-practice.md => communication-practice.rst} (75%)

diff --git a/source/communication-practice.md b/source/communication-practice.rst
similarity index 75%
rename from source/communication-practice.md
rename to source/communication-practice.rst
index 19ddf66..3ccc087 100644
--- a/source/communication-practice.md
+++ b/source/communication-practice.rst
@@ -1,15 +1,19 @@
-# Communication Best Practice
+Communication Best Practice
+***************************
 
 This guide provides communication Best Practice that helps you in
+
 * Using welcoming and inclusive language
 * Keeping discussions technical and actionable
 * Being respectful of differing viewpoints and experiences
 * Being aware of your own and counterpart’s communication style and culture
 * Show empathy towards other community members
 
-## Code reviews for **reviewers** and **patch authors**
+Code reviews for **reviewers** and **patch authors**
+====================================================
 
 Before embarking on a code review, it is important to remember that
+
 * A poorly executed code review can hurt the contributors feeling, even when a
   reviewer did not intend to do so. Feeling defensive is a normal reaction to
   a critique or feedback. A reviewer should be aware of how the pitch, tone,
@@ -28,7 +32,8 @@ Before embarking on a code review, it is important to remember that
   are all trying to create a productive, welcoming and agile environment, we do
   not always succeed.
 
-### Express appreciation
+Express appreciation
+--------------------
 
 As the nature of code review to find bugs and possible issues, it is very easy
 for reviewers to get into a mode of operation where the patch review ends up
@@ -40,21 +45,28 @@ sets the tone for the rest of the code review. Starting **every** review on a
 positive note, helps set the tone for the rest of the review.
 
 For an initial patch, you can use phrases such as
-> Thanks for the patch
-> Thanks for doing this
+
+  *Thanks for the patch*
+  
+  *Thanks for doing this*
 
 For further revisions within a review, phrases such as
-> Thank you for addressing the last set of changes
+
+  *Thank you for addressing the last set of changes*
 
 If you believe the code was good, it is good practice to highlight this by
 using phrases such as
-> Looks good, just a few comments
-> The changes you have made since the last version look good
+
+  *Looks good, just a few comments*
+  
+  *The changes you have made since the last version look good*
 
 If you think there were issues too many with the code to use one of the
 phrases, you can still start on a positive note, by for example saying
-> I think this is a good change
-> I think this is a good feature proposal
+
+  *I think this is a good change*
+  
+  *I think this is a good feature proposal*
 
 It is also entirely fine to highlight specific changes as good. The best place
 to do this, is at the top of a patch, as addressing code review comments
@@ -68,13 +80,17 @@ interpreted as such.
 
 Appreciation should also be expressed by patch authors when asking for
 clarifications to a review or responding to questions. A simple
-> Thank you for your feedback
-> Thank you for your reply
-> Thank you XXX!
+
+  *Thank you for your feedback*
+  
+  *Thank you for your reply*
+  
+  *Thank you XXX!*
 
 is normally sufficient.
 
-### Avoid inflammatory and negatively charged language
+Avoid inflammatory and negatively charged language
+--------------------------------------------------
 
 The way a reviewer expresses feedback, has a big impact on how the author
 perceives the feedback. Choosing negatively charged language such as your code
@@ -84,12 +100,12 @@ communication difficult. The same is true when a patch author is responding to
 a comment from a reviewer.
 
 One of our maintainers has been studying Mandarin for several years and has
-come across the most strongly-worded dictionary entry [he has ever seen][1].
+come across the most strongly-worded dictionary entry `he has ever seen <1_>`_.
 This example illustrates the differences between an inflammatory and fact-based
 description extremely well.
 
-> 裹脚 (guo3 jiao3): foot-binding (a vile feudal practice which crippled women
-> both physically and spiritually)
+  *裹脚 (guo3 jiao3): foot-binding (a vile feudal practice which crippled women
+  both physically and spiritually)*
 
 This is not something one is used to hearing from dictionary entries. Once you
 investigate the practice foot-binding, it is hard to disagree with the
@@ -99,16 +115,16 @@ by this statement. The main take-away is that the author of the dictionary
 entry had strong opinions about this topic. It does not tell you why you
 should have the same opinion.
 
-Compare this to the [Wikipedia entry][2]
+Compare this to the `Wikipedia entry <2_>`_
 
-> Foot binding was the custom of applying tight binding to the feet of young
-> girls to modify the shape and size of their feet. ... foot binding was a
-> painful practice and significantly limited the mobility of women, resulting
-> in lifelong disabilities for most of its subjects. ... Binding usually
-> started during the winter months since the feet were more likely to be numb,
-> and therefore the pain would not be as extreme. …The toes on each foot
-> were curled under, then pressed with great force downwards and squeezed
-> into the sole of the foot until [redacted] ...
+  *Foot binding was the custom of applying tight binding to the feet of young
+  girls to modify the shape and size of their feet. ... foot binding was a
+  painful practice and significantly limited the mobility of women, resulting
+  in lifelong disabilities for most of its subjects. ... Binding usually
+  started during the winter months since the feet were more likely to be numb,
+  and therefore the pain would not be as extreme. …The toes on each foot
+  were curled under, then pressed with great force downwards and squeezed
+  into the sole of the foot until [redacted] ...*
 
 Without going into the details of foot-binding, it is noticeable that the
 definition is a list of simple facts that are laid out in a way that make it
@@ -118,10 +134,13 @@ Because the Wikipedia entry is entirely fact based it is more powerful and
 persuasive than the dictionary entry. The same applies to code reviews.
 
 Making statements in code reviews such as
-> Your code is garbage
-> This idea is stupid
+
+  *Your code is garbage*
+  
+  *This idea is stupid*
 
 besides negatively charged, rude and counter productive
+
 * It will make the patch author angry: instead of finding a solution to the
   problem the author will spend time and mental energy wrestling with their
   feelings
@@ -129,16 +148,21 @@ besides negatively charged, rude and counter productive
 * Facts are both more powerful and more persuasive
 
 Consider the following two pieces of feedback on a piece of code
-> This piece of code is confusing
-> It took me a long time to ﬁgure out what was going on here
+
+  *This piece of code is confusing*
+  
+  *It took me a long time to ﬁgure out what was going on here*
 
 The first example expresses an opinion, whereas the second re-phrases the
 statement in terms of what you experienced, which is a fact.
 
 Other examples:
-> BAD: This is fragile
-> SOMEWHAT BETTER: This seems fragile to me
-> BEST: If X happens, Y will happen.
+
+  **BAD**: *This is fragile*
+  
+  **SOMEWHAT BETTER**: *This seems fragile to me*
+  
+  **BEST**: *If X happens, Y will happen.*
 
 A certain piece of code can be written in many different ways: this can lead to
 disagreements on the best architecture, design or coding pattern. As already
@@ -146,33 +170,40 @@ pointed out in this section: avoid feedback that is opinion-based and thus
 does not add any value. Back your criticism (or idea on how to solve a
 problem) with a sensible rationale.
 
-### Review the code, not the person
+Review the code, not the person
+-------------------------------
 
 Without realizing it, it is easy to overlook the difference between insightful
 critique of code and personal criticism. Let's look at a theoretical function
 where there is an opportunity to return out of the function early. In this
 case, you could say
 
-> You should return from this function early, because of XXX
+  *You should return from this function early, because of XXX*
 
 On its own, there is nothing wrong with this statement. However, a code review
 is made up of multiple comments and using **You should** consistently can
 start to feel negative and can be mis-interpreted as a personal attack. Using
 something like avoids this issue:
 
-> Returning from this function early is better, because of XXX
+  *Returning from this function early is better, because of XXX*
 
 Without personal reference, a code review will communicate the problem, idea
 or issue without risking mis-interpretation.
 
-### Verbose vs. terse
+Verbose vs. terse
+-----------------
 
 Due to the time it takes to review and compose code reviewer, reviewers often
 adopt a terse style. It is not unusual to see review comments such as
-> typo
-> s/resions/regions/
-> coding style
-> coding style: brackets not needed
+
+  *typo*
+  
+  *s/resions/regions/*
+  
+  *coding style*
+  
+  *coding style: brackets not needed*
+  
 etc.
 
 Terse code review style has its place and can be productive for both the
@@ -194,7 +225,8 @@ style and ask whether the author is OK with it. In almost all cases, they will
 be: by asking you are showing empathy that helps counteract a negative
 impression.
 
-### Clarity over verbosity
+Clarity over verbosity
+----------------------
 
 When reading this document, you may get the impression that following the
 guidance outlined here takes more effort and time for both code reviewers and
@@ -204,21 +236,26 @@ iterations during communication. We value **clarity over verbosity**.
 
 Areas which often create unnecessary back-and-forth between reviewers and
 authors are
+
 * Unstated assumptions and goals
 * Leave suggestions, examples, and resources (such as links to existing code)
 * There is nothing more helpful for the thought process than example. It
   guarantees that you have a shared understanding and reduces the questions
   asked on a comment.
 
-### Code Review Comments should be actionable
+Code Review Comments should be actionable
+-----------------------------------------
 
 Code review comments should be actionable: in other words, it needs to be clear
 what the author of the code needs to do to address the issue you identified.
 
 Statements such as
-> BAD: This is wrong
-> BAD: This does not work
-> BETTER, BUT NOT GOOD: This does not work, because of XXX
+
+  **BAD**: *This is wrong*
+  
+  **BAD**: *This does not work*
+  
+  **BETTER, BUT NOT GOOD**: *This does not work, because of XXX*
 
 do not normally provide the author of a patch with enough information to send
 out a new patch version. By doing this, you essentially force the patch author
@@ -227,29 +264,34 @@ acceptable to you as the **reviewer** of the patch.
 
 A better way to approach this is to say
 
-> This does not work, because of XXX
-> You may want to investigate YYY and ZZZ as alternatives
+  *This does not work, because of XXX*
+  
+  *You may want to investigate YYY and ZZZ as alternatives*
 
 In some cases, it may not be clear whether YYY or ZZZ are the better solution.
 As a reviewer you should be as up-front and possible in such a case and say
 something like
 
-> I am not sure whether YYY and ZZZ are better, so you may want to outline your
-> thoughts about both solutions by e-mail first, such that we can decide what
-> works best
+  *I am not sure whether YYY and ZZZ are better, so you may want to outline your
+  thoughts about both solutions by e-mail first, such that we can decide what
+  works best*
 
-### Identify the severity and optionality of review comments
+Identify the severity and optionality of review comments
+--------------------------------------------------------
 
 By default, every comment which is made **ought to be addressed** by the
 author. However, sometimes reviewers note issues, which would be nice if they
 were addressed, but are not mandatory to fix.
 
 Typically, reviewers use terminology such as
-> This would be a nice-to-have
-> This is not a blocker
+
+  *This would be a nice-to-have*
+  
+  *This is not a blocker*
 
 Some maintainers use
-> NIT: XXX
+
+  *NIT: XXX*
 
 however, it is sometimes also used to indicate a minor issue that **must** be
 fixed. Also terminology such as **this is not a blocker** could be
@@ -258,35 +300,42 @@ clear whether a comment is an optional suggestion. Examples may be
 > NIT (optional): XXX
 > I think it would be good if X also did Y, not a requirement but nice-to-have
 
-### Identify the severity of a disagreement
+Identify the severity of a disagreement
+---------------------------------------
 
 During a code review, it can happen that reviewer and author disagree on how
 to move forward. The default position when it comes to disagreements is that
 **both parties want to argue their case**. However, frequently one or both
 parties do not feel that strongly about a specific issue.
 
-Within the Xen Project, we have [a way][3] to highlight one's position on
-proposals, formal or informal votes using the following notation:
-> +2 : I am happy with this proposal, and I will argue for it
-> +1 : I am happy with this proposal, but will not argue for it
-> 0 : I have no opinion
-> -1 : I am not happy with this proposal, but will not argue against it
-> -2 : I am not happy with this proposal, and I will argue against it
+Within the Xen Project, we have `a way <3_>`_ to highlight one's position on
+proposals, formal or informal votes using the following notation::
+
+ +2 : I am happy with this proposal, and I will argue for it
+ +1 : I am happy with this proposal, but will not argue for it
+  0 : I have no opinion
+ -1 : I am not happy with this proposal, but will not argue against it
+ -2 : I am not happy with this proposal, and I will argue against it
 
 You can use a phrase such as
-> I am not happy with this suggestion, but will not argue against it
+
+  *I am not happy with this suggestion, but will not argue against it*
 
 to make clear where you stand, while recording your position. Conversely, a
 reviewer may do something similar
-> I am not happy with XYZ, but will not argue against it [anymore]
-> What we have now is good enough, but could be better
 
-### Authors: responding to review comments
+  *I am not happy with XYZ, but will not argue against it [anymore]*
+  
+  *What we have now is good enough, but could be better*
+
+Authors: responding to review comments
+--------------------------------------
 
 Typically patch authors are expected to **address all** review comments in the
 next version of a patch or patch series. In a smooth-running code review where
 you do not have further questions it is not at all necessary to acknowledge
 the changes you are going to make:
+
 * Simply send the next version with the changes addressed and record it in the
   change-log
 
@@ -297,22 +346,26 @@ exceptionally long.
 In cases where there was discussion and maybe disagreement, it does however
 make sense to close the discussion by saying something like
 
-> ACK
-> Seems we are agreed, I am going to do this
+  *ACK*
+  
+  *Seems we are agreed, I am going to do this*
 
 Other situations when you may want to do this are cases where the reviewer made
 optional suggestions, to make clear whether the suggestion will be followed or
 not.
 
-### Avoid uncommon words: not everyone is a native English speaker
+Avoid uncommon words: not everyone is a native English speaker
+--------------------------------------------------------------
 
 Avoid uncommon words both when reviewing code or responding to a review. Not
 everyone is a native English speaker. The use of such words can come across
 badly and can lead to misunderstandings.
 
-### Prioritize significant flaws
+Prioritize significant flaws
+----------------------------
 
 If a patch or patch series has significant flaws, such as
+
 * It is built on wrong assumptions
 * There are issues with the architecture or the design
 
@@ -326,15 +379,17 @@ establish and agree whether a series or part of a series has a significant
 flaw and agree a course of action.
 
 A pragmatic approach would be to
+
 * Highlight problematic portions of a series in the cover letter
 * For the patch author and reviewer(s) to agree that for problematic to omit
   style and minor issues in the review, until the significant flaw is addressed
 
 This saves both the patch author and reviewer(s) time. Note that some
-background is covered in detail in [Problematic Patch Reviews][4].
+background is covered in detail in `Problematic Patch Reviews <4_>`_.
 
 
-### Reviewers: Welcome newcomers
+Reviewers: Welcome newcomers
+----------------------------
 
 When reviewing the first few patches of a newcomer to the project, you may want
 spend additional time and effort in your code review. This contributes to a
@@ -343,6 +398,7 @@ relationship in the long term.
 
 When someone does their first code submission, they will not be familiar with
 **all** conventions in the project. A good approach is to
+
 * Welcome the newcomer
 * Offer to help with specific questions, for example on IRC
 * Point to existing documentation: in particular if mistakes with the
@@ -350,21 +406,23 @@ When someone does their first code submission, they will not be familiar with
   process makes the process more seamless for the contributor. So, you could
   say something like
 
-> Hi XXX. Welcome to the community and thank you for the patch
->
-> I noticed that the submission you made seems to not follow our process.
-> Are you aware of this document at YYY? If you follow the instructions the
-> entire code submission process and dealing with review comments becomes
-> much easier. Feel free to find me on IRC if you need specific help. My IRC
-> handle is ZZZ
+  *Hi XXX. Welcome to the community and thank you for the patch*
+  
+  *I noticed that the submission you made seems to not follow our process.
+  Are you aware of this document at YYY? If you follow the instructions the
+  entire code submission process and dealing with review comments becomes
+  much easier. Feel free to find me on IRC if you need specific help. My IRC
+  handle is ZZZ*
 
-### Reviewers: Take account of previous reviewer(s) comments
+Reviewers: Take account of previous reviewer(s) comments
+--------------------------------------------------------
 
 Sometimes multiple reviewers share reviewing a series. For example,
 reviewer John has reviewed the first 5 iterations of the series. The patch
 author has addressed all of John's comments and Susan comes in and picks up
 the series after iteration 5. In such cases it is possible that John and Susan
 have different styles, such as
+
 * different preferences on the code layout
 * different preferences on code style
 
@@ -374,12 +432,13 @@ code author. In addition, it also causes extra work for Susan. The easiest way
 to avoid such situations, would be for Susan to focus on faulty code only and
 to disregard personal preferences when taking over the review of a series.
 
-### Reviewers: Review the code, then review the review
+Reviewers: Review the code, then review the review
+--------------------------------------------------
 
 As stated earlier it is often difficult to mentally separate finding issues
 from articulating code review comments in a constructive and positive manner.
 Even as an experienced code reviewer you can be in a bad mood, which can
- impact your communication style.
+impact your communication style.
 
 A good trick to avoid this, is to start and complete the code review and then
 **not send it immediately**. You can then have a final go over the code review
@@ -391,21 +450,24 @@ scan before pressing the send button.
 Generally, it is a good idea for code reviewers to do this regularly, purely
 from the viewpoint of self-improvement and self-awareness.
 
-## Common Communication Pitfalls
+Common Communication Pitfalls
+=============================
 
 This section contains common communication issues and provides suggestions on
 how to avoid them and resolve them. These are **general** issues which affect
 **all** online communication. As such, we can only try and do our best.
 
-### Misunderstandings
+Misunderstandings
+-----------------
 
 When you meet face to face, you can read a person’s emotions. Even with a
 phone call, someone’s tone of voice can convey a lot of information. Using
 on-line communication channels you are flying blind, which often leads to
-misunderstandings. [Research][5] shows that in up to 50% of email
+misunderstandings. `Research <5_>`_ shows that in up to 50% of email
 conversations, the tone of voice is misinterpreted.
 
 In code reviews and technical discussions in general we tend to see two things
+
 * The reviewer or author interprets an exchange as too critical, passive
   aggressive, or other: this usually comes down to different cultures and
   communication styles, which are covered in the next section
@@ -415,22 +477,25 @@ In the latter case, the key to resolution is to **identify the
 misunderstanding** as quickly as possible and call it out and de-escalate
 rather than let the misunderstanding linger. This is inherently difficult and
 requires more care than normal communication. Typically you would start with
+
 * Showing appreciation
 * Highlighting the potential misunderstanding and verifying whether the other
   person also feels that maybe there was a misunderstanding
 * Proposing a way forward: for example, it may make sense to move the
-  conversation from the mailing list to [IRC][6] either in private or public,
+  conversation from the mailing list to `IRC <6_>`_ either in private or public,
   a community call or a private phone/video call.
 
 It is entirely acceptable to do this in a direct reply to your communication
 partner, rather than on a public e-mail list on or an otherwise public forum.
 
 A good approach is to use something like the following:
-> Hi XXX! Thank you for the insights you have given me in this code review
-> I feel that we are misunderstanding each other on the topic of YYY
-> Would you mind trying to resolve this on IRC. I am available at ZZZ
+
+  *Hi XXX! Thank you for the insights you have given me in this code review
+  I feel that we are misunderstanding each other on the topic of YYY
+  Would you mind trying to resolve this on IRC. I am available at ZZZ*
 
 Usually, technical misunderstandings come down two either
+
 1. Misinterpreting what the other person meant
 2. Different - usually unstated - assumptions on how something works or what
    is to be achieved
@@ -443,9 +508,10 @@ caused the misunderstanding, such that all parties can move forward.
 Typically, 1 and 2 are easily resolved and will lead back to a constructive
 discussion. Whereas 3 and 4 may highlight an inherent disagreement, which may
 need to be resolved through techniques as
-outlined in [Resolving Disagreement][7].
+outlined in :doc:`Resolving Disagreement <resolving-disagreement>`.
 
-### Cultural differences and different communication styles
+Cultural differences and different communication styles
+-------------------------------------------------------
 
 The Xen Project is a global community with contributors from many different
 backgrounds. Typically, when we communicate with a person we know, we factor
@@ -458,48 +524,53 @@ especially in sensitive situations such as conflict resolution, giving and
 receiving feedback, and consensus building.
 
 For example, giving direct feedback such as
-> [Please] replace XXX with YYY, as XXX does not do ZZZ
+
+  *[Please] replace XXX with YYY, as XXX does not do ZZZ*
 
 is acceptable and normal in some cultures, whereas in cultures which value
 indirect feedback it would be considered rude. In the latter case, something
 like the following would be used
-> This looks very good to me, but I believe you should use YYY here,
-> because XXX would....
+
+  *This looks very good to me, but I believe you should use YYY here,
+  because XXX would....*
 
 The key to working and communicating well with people from different cultural
 backgrounds is **self-awareness**, which can then be used to either
+
 * Adapt your own communication style depending on who you talk to
 * Or to find a middle-ground that covers most bases
 
 A number of different theories in the field of working effectively are
 currently popular, with the most well-known one being
-[Erin Meyer's Culture Map][8]. A short overview can be found [here][9]
+`Erin Meyer's Culture Map <8_>`_. A short overview can be found `here <9_>`_
 (33 slides).
 
-### Code reviews and discussions are not competitions
+Code reviews and discussions are not competitions
+-------------------------------------------------
 
 Code reviews on our mailing lists are not competitions on who can come up with
 the smartest solution or who is the real coding genius.
 
 In a code review - as well as in general - we expect that all stake-holders
+
 * Gracefully accept constructive criticism
 * Focus on what is best for the community
 * Resolve differences in opinion effectively
 
 The next section provides pointers on how to do this effectively.
 
-### Resolving Disagreement Effectively
+Resolving Disagreement Effectively
+----------------------------------
 
-Common scenarios are covered our guide on [Resolving Disagreement][7], which
+Common scenarios are covered our guide on :doc:`Resolving Disagreement <resolving-disagreement>`, which
 lays out situations that can lead to dead-lock and shows common patterns on
 how to avoid and resolve issues.
 
-[1]: https://youtu.be/ehZvBmrLRwg?t=834
-[2]: https://en.wikipedia.org/wiki/Foot_binding
-[3]: https://xenproject.org/developers/governance/#expressingopinion
-[4]: resolving-disagreement.md#problems
-[5]: https://www.wired.com/2006/02/the-secret-cause-of-flame-wars/
-[6]: https://xenproject.org/help/irc/
-[7]: resolving-disagreement.md
-[8]: https://en.wikipedia.org/wiki/Erin_Meyer
-[9]: https://www.nsf.gov/attachments/134059/public/15LFW_WorkingWithMulticulturalTeams_LarsonC.pdf
+.. _1: https://youtu.be/ehZvBmrLRwg?t=834
+.. _2: https://en.wikipedia.org/wiki/Foot_binding
+.. _3: https://xenproject.org/developers/governance/#expressingopinion
+.. _4: resolving-disagreement.md#problems
+.. _5: https://www.wired.com/2006/02/the-secret-cause-of-flame-wars/
+.. _6: https://xenproject.org/help/irc/
+.. _8: https://en.wikipedia.org/wiki/Erin_Meyer
+.. _9: https://www.nsf.gov/attachments/134059/public/15LFW_WorkingWithMulticulturalTeams_LarsonC.pdf
diff --git a/source/conf.py b/source/conf.py
index 85bcedb..b63b196 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -50,3 +50,5 @@ html_theme = 'alabaster'
 # relative to this directory. They are copied after the builtin static files,
 # so a file named "default.css" will overwrite the builtin "default.css".
 html_static_path = ['_static']
+
+highlight_language = 'none'
diff --git a/source/index.rst b/source/index.rst
index d1152c4..be162cf 100644
--- a/source/index.rst
+++ b/source/index.rst
@@ -13,6 +13,7 @@ Welcome to XenProject Governance's documentation!
    code-of-conduct
    communication-guide
    code-review-guide
+   communication-practice
 
 Indices and tables
 ==================
-- 
2.24.3 (Apple Git-128)


